"""
stock basic download
--------------------
download stock basic data from tushare

- stock_list: stock list
- trading_calendar: trading calendar
"""

import pandas as pd
import tushare as ts


def stock_list(list_status: str) -> pd.DataFrame:
    """
    Get stock list
    :param list_status: str, list status, options('L', 'D', 'P')
    :return: pd.DataFrame, stock list
    """
    pro = ts.pro_api()
    df = pro.stock_basic(**{
        "ts_code": "",
        "name": "",
        "exchange": "",
        "market": "",
        "is_hs": "",
        "list_status": list_status,
        "limit": "",
        "offset": ""
    }, fields=[
        "ts_code",
        "symbol",
        "name",
        "area",
        "industry",
        "market",
        "list_date"  # date
    ])
    df['list_date'] = pd.to_datetime(df['list_date']).dt.date
    return df


def trading_calendar():
    pro = ts.pro_api()
    df = pro.trade_cal(**{
        "exchange": "",
        "cal_date": "",
        "start_date": "",
        "end_date": "",
        "is_open": "",
        "limit": "",
        "offset": ""
    }, fields=[
        "exchange",
        "cal_date",  # date
        "is_open",
        "pretrade_date"  # date
    ])
    df['cal_date'] = pd.to_datetime(df['cal_date']).dt.date
    df['pretrade_date'] = pd.to_datetime(df['pretrade_date']).dt.date
    return df


if __name__ == '__main__':
    import time
    start = time.time()

    # main operation
    stock_list_df = stock_list('L')
    print(stock_list_df)
    trading_calendar_df = trading_calendar()
    print(trading_calendar_df)

    # time cost
    time_cost = time.time() - start
    print(f'-----------------------------------------------------------------------------\n\
            time cost ({time_cost:.2f} s) or ({time_cost/60 :.2f} mins)')
