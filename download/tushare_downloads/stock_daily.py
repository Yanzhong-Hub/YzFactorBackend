"""
stock daily download
--------------------
download stock basic data from tushare

- stock_daily: original stock daily data
- stock_daily_adj: stock daily data with adjusted factor, back-adjusted
"""

import pandas as pd
import tushare as ts


def stock_daily(ts_code: str, start_date: str = '', end_date: str = '') -> pd.DataFrame:
    """
    Get stock daily data
    :param ts_code: str, stock code
    :param start_date: str, start date, format: YYYYMMDD, default: ''
    :param end_date: str, end date, format: YYYYMMDD, default: ''
    :return: pd.DataFrame, stock daily data
    ----------------------------------------
    original stock daily data
    """
    pro = ts.pro_api()
    df = pro.daily(**{
        "ts_code": ts_code,
        "trade_date": "",
        "start_date": start_date,
        "end_date": end_date,
        "offset": "",
        "limit": ""
    }, fields=[
        "ts_code",
        "trade_date",  # date
        "open",
        "high",
        "low",
        "close",
        "pre_close",
        "change",
        "pct_chg",
        "vol",
        "amount"
    ])
    df['trade_date'] = pd.to_datetime(df['trade_date']).dt.date
    return df


def stock_daily_adj(ts_code: str, start_date: str = '', end_date: str = '') -> pd.DataFrame:
    """
    Get stock daily data with adjusted factor, back-adjusted
    :param ts_code: str, stock code
    :param start_date: str, start date, format: YYYYMMDD, default: ''
    :param end_date: str, end date, format: YYYYMMDD, default: ''
    :return: pd.DataFrame, stock daily data
    """
    df = ts.pro_bar(ts_code=ts_code, adj='hfq', start_date=start_date, end_date=end_date)
    df['trade_date'] = pd.to_datetime(df['trade_date']).dt.date
    return df


if __name__ == '__main__':

    import time
    start = time.time()

    # main operation
    # stock_daily
    df = stock_daily(ts_code='000001.SZ', start_date='20190101', end_date='20190131')
    print(df)
    # stock_daily_adj
    df = stock_daily_adj(ts_code='000001.SZ', start_date='20190101', end_date='20190131')
    print(df)

    # time cost
    time_cost = time.time() - start
    print(f'-----------------------------------------------------------------------------\n\
            time cost ({time_cost:.2f} s) or ({time_cost/60 :.2f} mins)')
    

