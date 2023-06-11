"""
Time series data type

- TimeSeriesBase
- TDailyClose
- TDailyPctChg
- TDailyCloseAdj
- TDailyPctChgAdj
- TCustom

Naming method:
    T + {Frequency} + {Type}
"""


import pandas as pd

from datetime import datetime

from dataclasses import dataclass, field
from abc import ABC, abstractmethod
from typing import Callable

from database import db_connect


@dataclass(slots=True)
class TimeSeriesBase(ABC):

    code: str
    start_date: datetime
    end_date: datetime
    data: pd.DataFrame = field(default_factory=pd.DataFrame)
    name: str = field(init=False)
    empty: bool = field(init=False)

    def __post_init__(self) -> None:
        self.set_data()
        self.set_name()
        self.set_empty()

    @abstractmethod
    def set_data(self) -> None:
        """set data method, unique to each subclass"""
        ...

    def set_name(self) -> None:
        """set name, based on the self.data column name"""
        self.name = str(self.data.columns[0])
    
    def set_empty(self) -> None:
        """set empty, based on the self.data empty status"""
        self.empty = self.data.empty
    
    def __bool__(self) -> bool:
        return not self.empty
    
    def __str__(self) -> str:
        if self.empty:
            return f"{self.__class__.__name__} \n{self.name}, code: {self.code} is empty! \ndate range: {self.start_date.date()} - {self.end_date.date()}"
        else:
            return f"{self.__class__.__name__} \n{self.name}, code: {self.code} \n date range: {self.start_date.date()} - {self.end_date.date()}, \nlength: {len(self.data)}"
        
    def __repr__(self) -> str:
        if self.empty:
            return f"{self.__class__.__name__} \n{self.name}, code: {self.code} is empty! \n date range: {self.start_date.date()} - {self.end_date.date()}"
        else:
            return f"{self.__class__.__name__} \n{self.name}, code: {self.code} \n date range: {self.start_date.date()} - {self.end_date.date()}, \nlength: {len(self.data)}"
    
    def __len__(self) -> int:
        return len(self.data)

    def __slice__(self, start_date: datetime, end_date: datetime) -> pd.DataFrame:
        return self.data.loc[start_date:end_date]
    
    def __getitem__(self, date: datetime) -> pd.DataFrame:
        return self.data.loc[date:date]
    

@dataclass(slots=True)
class TDailyClose(TimeSeriesBase):

    def set_data(self) -> None:
        """set data method, get daily close data from database"""
        db = db_connect()
        sql = f'SELECT trade_date, close FROM stock_daily WHERE ts_code = "{self.code}" AND trade_date >= "{self.start_date}" AND trade_date <= "{self.end_date}"'
        self.data = db.get_data(sql=sql)
        db.dispose()

        # format data
        self.data.set_index('trade_date', inplace=True)  # set index  # type: ignore
        self.data.index = pd.to_datetime(self.data.index)  # convert index to datetime  # type: ignore
        self.data.columns = [f'{self.code}_close']
        self.data.sort_index(inplace=True)  # sort index  # type: ignore


@dataclass(slots=True)
class TDailyPctChg(TimeSeriesBase):
    
    def set_data(self) -> None:
        """set data method, get daily pct change data from database"""
        db = db_connect()
        sql = f'SELECT trade_date, pct_chg FROM stock_daily WHERE ts_code = "{self.code}" AND trade_date >= "{self.start_date}" AND trade_date <= "{self.end_date}"'
        self.data = db.get_data(sql=sql)
        db.dispose()

        # format data
        self.data.set_index('trade_date', inplace=True)  # set index  # type: ignore
        self.data.index = pd.to_datetime(self.data.index)  # convert index to datetime  # type: ignore
        self.data.columns = [f'{self.code}_pct_chg']
        self.data.sort_index(inplace=True)  # sort index  # type: ignore
        self.data = self.data / 100  # convert to percentage
        

@dataclass(slots=True)
class TDailyCloseAdj(TimeSeriesBase):

    def set_data(self) -> None:
        """set data method, get daily adjusted close data from database"""
        db = db_connect()
        sql = f'SELECT trade_date, close FROM stock_daily_adj WHERE ts_code = "{self.code}" AND trade_date >= "{self.start_date}" AND trade_date <= "{self.end_date}"'
        self.data = db.get_data(sql=sql)
        db.dispose()

        # format data
        self.data.set_index('trade_date', inplace=True)  # set index  # type: ignore
        self.data.index = pd.to_datetime(self.data.index)  # convert index to datetime  # type: ignore
        self.data.columns = [f'{self.code}_close_adj']
        self.data.sort_index(inplace=True)  # sort index  # type: ignore


@dataclass(slots=True)
class TDailyPctChgAdj(TimeSeriesBase):

    def set_data(self) -> None:
        """set data method, get daily adjusted pct change data from database"""
        db = db_connect()
        sql = f'SELECT trade_date, pct_chg FROM stock_daily_adj WHERE ts_code = "{self.code}" AND trade_date >= "{self.start_date}" AND trade_date <= "{self.end_date}"'
        self.data = db.get_data(sql=sql)
        db.dispose()

        # format data
        self.data.set_index('trade_date', inplace=True)  # set index  # type: ignore
        self.data.index = pd.to_datetime(self.data.index)  # convert index to datetime  # type: ignore
        self.data.columns = [f'{self.code}_pct_chg_adj']
        self.data.sort_index(inplace=True)  # sort index  # type: ignore
        self.data = self.data / 100  # convert to percentage
        

CUSTOM_SET_DATA_FUNC = Callable[[TimeSeriesBase], None]


@dataclass(slots=True)
class TCustom(TimeSeriesBase):

    set_data_func: CUSTOM_SET_DATA_FUNC = field(default_factory=lambda: CUSTOM_SET_DATA_FUNC)

    def set_data(self) -> None:
        """set data method, unique to each subclass"""
        self.set_data_func(self)


def _test():

    code = '000001.SZ'
    start_date = datetime(2022, 12, 30)
    end_date = datetime(2023, 1, 31)       

    # test existing data types
    t_daily_close = TDailyClose(code=code, start_date=start_date, end_date=end_date)
    print(t_daily_close, '\n')
    t_daily_close_adj = TDailyCloseAdj(code=code, start_date=start_date, end_date=end_date)
    print(t_daily_close_adj, '\n')
    t_daily_pct_chg = TDailyPctChg(code=code, start_date=start_date, end_date=end_date)
    print(t_daily_pct_chg, '\n')
    t_daily_pct_chg_adj = TDailyPctChgAdj(code=code, start_date=start_date, end_date=end_date)
    print(t_daily_pct_chg_adj, '\n')

    # test custom data type
    def set_data(self: TimeSeriesBase) -> None:
        """set data method, get daily open data from database"""
        db = db_connect()
        sql = f'SELECT trade_date, open FROM stock_daily WHERE ts_code = "{self.code}" AND trade_date >= "{self.start_date}" AND trade_date <= "{self.end_date}"'
        self.data = db.get_data(sql=sql)
        db.dispose()

        # format data
        self.data.set_index('trade_date', inplace=True)  # set index  # type: ignore
        self.data.index = pd.to_datetime(self.data.index)  # convert index to datetime  # type: ignore
        self.data.columns = [f'{self.code}_open']
        self.data.sort_index(inplace=True)  # sort index  # type: ignore
    
    custom_time_series = TCustom(code=code, start_date=start_date, end_date=end_date, set_data_func=set_data)
    print(custom_time_series, '\n')
    print(custom_time_series.data.head(), '\n') 
    print(t_daily_close.data.head(), '\n')


if __name__ == '__main__':
    from timeit import timeit
    print(f'')
    print(f'time cost: {timeit(_test, number=1):.2f} s')
    