"""
cross section data type

- CrossSectionBase
- CDailyClose
- CDailyPctChg
- CDailyCloseAdj
- CDailyPctChgAdj
- CCustom
"""

import pandas as pd

from datetime import datetime

from dataclasses import dataclass, field
from abc import ABC, abstractmethod
from typing import Callable

from database import db_connect


@dataclass(slots=True)
class CrossSectionBase(ABC):

    trade_date: datetime
    stock_pool: list[str]
    data: pd.DataFrame = field(default_factory=pd.DataFrame)
    empty: bool = field(init=False)

    def __post_init__(self) -> None:
        self.set_data()
        self.set_empty()
    
    @abstractmethod
    def set_data(self) -> None:
        """set data method, unique to each subclass"""
        ...

    def set_empty(self) -> None:
        self.empty = self.data.empty
    
    def __bool__(self) -> bool:
        return not self.empty

    def __str__(self) -> str:
        if self.empty:
            return f"{self.__class__.__name__} \n{self.trade_date.date()} is empty!"
        else:
            return f"{self.__class__.__name__} \n{self.trade_date.date()}, \nlength: {len(self.data)}"
    
    def __repr__(self) -> str:
        if self.empty:
            return f"{self.__class__.__name__} \n{self.trade_date.date()} is empty!"
        else:
            return f"{self.__class__.__name__} \n{self.trade_date.date()}, \nlength: {len(self.data)}"
        
    def __len__(self) -> int:
        return len(self.data)
    
    def __getitem__(self, code: str) -> pd.DataFrame:
        return self.data.loc[code]  # type: ignore
    
    
@dataclass(slots=True)
class CDailyClose(CrossSectionBase):

    def set_data(self) -> None:
        db = db_connect()
        sql = f"SELECT ts_code, close FROM stock_daily WHERE trade_date = '{self.trade_date}' AND code IN {tuple(self.stock_pool)}"
        self.data = db.get_data(sql)
        db.dispose()


def _test():
    db = db_connect()
    markes = ['主板', '中小板', '创业板']
    sql = f'SELECT ts_code FROM stock_list WHERE market'



