"""
multi-process download
"""

import time
import pandas as pd

from typing import Callable
from concurrent.futures import ProcessPoolExecutor

from database import db_connect, create_all_table_by_sql
from download.tushare_config import set_token
from download.tushare_downloads import *


# [ts_code, start_date, end_date] output data
TUSHARE_DOWNLOAD = Callable[[str, str, str], pd.DataFrame]


def multi_process_download(download_function: TUSHARE_DOWNLOAD,
                           ts_code_list: list,
                           table_name: str,
                           start_date: str = '',
                           end_date: str = '',
                           max_workers: int = 9) -> None:
    """
    multi-process download
    :param func: Callable[[str, str, str], pd.DataFrame], download function
    :param ts_code_list: list, stock code list
    :param start_date:t: YYYYMMDD, default: ''
    :param max_workers: int, max wo str, start date, format: YYYYMMDD, default: ''
    :param end_date: str, end date, formarkers, default: 9
    :return: pd.DataFrame, data
    """
    with ProcessPoolExecutor(max_workers=max_workers) as executor:
        results = executor.map(init_single,
                               [download_function] * len(ts_code_list),
                               ts_code_list,
                               [table_name] * len(ts_code_list),
                               [start_date] * len(ts_code_list),
                               [end_date] * len(ts_code_list))
        for result in results:
            print(result)


def init_stock_list() -> None:
    """download stock list"""
    db = db_connect()
    if not db.is_table_empty('stock_list'):
        return
    # download stock list
    stock_list_L = stock_list('L')
    stock_list_D = stock_list('D')
    stock_list_P = stock_list('P')
    # save to database
    db.save_data(stock_list_L, 'stock_list', if_exists='append', index=False)
    db.save_data(stock_list_D, 'stock_list', if_exists='append', index=False)
    db.save_data(stock_list_P, 'stock_list', if_exists='append', index=False)
    db.dispose()


def init_trade_calendar() -> None:
    """download trade calendar"""
    db = db_connect()
    if not db.is_table_empty('trading_calendar'):
        return
    # download trade calendar
    trading_calendar_data = trading_calendar()
    # save to database
    db.save_data(trading_calendar_data, 'trading_calendar',
                 if_exists='append', index=False)
    db.dispose()


def init_single(download_function: TUSHARE_DOWNLOAD,
                ts_code: str,
                db_table_name: str,
                start_date: str = '',
                end_date: str = '') -> str:
    """
    download single stock data
    :param ts_code: str, stock code
    :return: str, success info
    """
    # download stock daily data
    single_data = None
    try:
        single_data = download_function(ts_code, start_date, end_date)
    except Exception as e:
        if type(e) == TypeError:
            return f'{download_function.__name__}: None data in Tushare.pro, pass {ts_code}'
        print(
            f'{download_function.__name__}: {ts_code} failed, {e}, redownloading in 60 seconds...')
        time.sleep(60)
        init_single(download_function, ts_code, start_date, end_date)

    # save to database
    if type(single_data) == pd.DataFrame and not single_data.empty:
        db = db_connect()
        try:
            db.save_data(single_data, db_table_name,
                        if_exists='append', index=False)
            db.dispose()
            return f'{download_function.__name__}: {ts_code} success'
        except Exception as e:
            return f'{download_function.__name__}: {ts_code} saving failed, {e}, redownloading in 60 seconds...'
    else:
        return f'{download_function.__name__}: {ts_code} empty, pass!'


def init_main(start_date: str, end_date: str) -> None:
    """init main"""
    # create all table
    create_all_table_by_sql(table_structure_path='database/table_structures')

    # set token
    set_token()
    # download stock list
    init_stock_list()

    # download trade calendar
    init_trade_calendar()

    # download stock daily data
    db = db_connect()
    if db.is_table_empty('stock_daily'):
        stock_list = pd.read_sql('stock_list', db_connect().engine)[
            'ts_code'].tolist()
        multi_process_download(stock_daily, stock_list,
                               'stock_daily', start_date, end_date)

    # download stock daily data with adjusted factor
    if db.is_table_empty('stock_daily_adj'):
        stock_list = pd.read_sql('stock_list', db_connect().engine)[
            'ts_code'].tolist()
        multi_process_download(stock_daily_adj, stock_list,
                               'stock_daily_adj', start_date, end_date)

    # download stock balance sheet data
    if db.is_table_empty('balance_sheet'):
        stock_list = pd.read_sql('stock_list', db_connect().engine)[
            'ts_code'].tolist()
        multi_process_download(balance_sheet, stock_list,
                               'balance_sheet', start_date, end_date)

    # download stock income statement data
    if db.is_table_empty('income_statement'):
        stock_list = pd.read_sql('stock_list', db_connect().engine)[
            'ts_code'].tolist()
        multi_process_download(income_statement, stock_list,
                               'income_statement', start_date, end_date)

    # download stock cash flow data
    if db.is_table_empty('cash_flow'):
        stock_list = pd.read_sql('stock_list', db_connect().engine)[
            'ts_code'].tolist()
        multi_process_download(cash_flow, stock_list,
                               'cash_flow', start_date, end_date)
    # dispose
    db.dispose()


if __name__ == '__main__':
    import time
    start = time.time()

    # main operation
    init_main('20091231', '20230531')

    # time cost
    end = time.time()
    print(
        f'Running time: {end - start:.2f} Seconds or {(end - start) / 60:.2f} Minutes')
