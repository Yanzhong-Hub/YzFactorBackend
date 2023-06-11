"""
Database basic
"""

import os
import json
import pandas as pd

from sqlalchemy import create_engine, MetaData, text
from sqlalchemy.ext.declarative import declarative_base
from urllib.parse import quote_plus as urlquote

from typing import Any


class DataBaseBasic:
    """Database basic class"""

    def __init__(self,
                 host: str,
                 port: int,
                 username: str,
                 password: str,
                 database: str,
                 engine: str = 'pymysql') -> None:
        """initialize database connection"""
        engine_config = f'mysql+{engine}://{username}:{urlquote(password)}@{host}:{port}/{database}'
        self.engine = create_engine(engine_config, echo=False)

    def save_data(self, data: pd.DataFrame, table_name: str, **kwargs: Any) -> None:
        """
        Save Data to Database
        :param data: pd.DataFrame, data to save
        :param table_name: str, table name
        :param kwargs: other parameters
        :return: None
        --------------------------------
        """
        data.to_sql(name=table_name, con=self.engine, **kwargs)

    def get_data(self, sql: str, **kwargs: object) -> pd.DataFrame:
        """
        Get Data from Database
        :param sql: str, sql query str
        :return: pd.DataFrame, data
        """
        return pd.read_sql(sql=sql, con=self.engine, **kwargs)  # type: ignore

    def create_table_by_sql_file(self, sql_file_path: str) -> None:
        """
        Create table by sql file
        :param sql_file_path: str, sql file path
        :return: None
        """
        with open(sql_file_path, 'r') as f:
            raw_text = f.read()
            # seperate sql by ';'
            sql_list = raw_text.split(';')[:-1]

        connection = self.engine.connect()
        for sql in sql_list:
            if sql:
                connection.execute(text(sql))
        connection.close()

    def create_table_by_dict(self, table_name: str, table_structure: dict[str, str])-> None:
        """
        Create table
        :param table_name: str, table name
        :param table_structure: dict, table structure
        :return: None
        """
        base = declarative_base()
        metadata = MetaData()
        metadata.reflect(bind=self.engine)

        if self.check_table(table_name):
            print(f'Table {table_name} already exists')
            return
        else:
            base.metadata.create_all(self.engine, tables=[table_structure])

    def drop_table(self, table_name: str) -> None:
        """
        Drop table
        :param table_name: str, table name
        :return: None
        """
        base = declarative_base()
        metadata = MetaData()
        metadata.reflect(bind=self.engine)

        try:
            table = metadata.tables[table_name]
            base.metadata.drop_all(self.engine, [table], checkfirst=True)
        except KeyError:
            print(f'No table named {table_name}')

    def get_all_table_name(self) -> list[str]:
        """
        Get all table name in database
        :return: list[str]
        """
        metadata = MetaData()
        metadata.reflect(bind=self.engine)
        return list(metadata.tables.keys())

    def check_table(self, table_name: str) -> bool:
        """
        Search table in database
        :param table_name: str, table name
        :return: bool
        """
        metadata = MetaData()
        metadata.reflect(bind=self.engine)
        try:
            metadata.tables[table_name]
            return True
        except KeyError:
            return False

    def is_table_empty(self, table_name: str) -> bool:
        """
        Check if table is empty
        :param table_name: str, table name
        :return: bool
        """
        return self.get_data(f'select * from {table_name} limit 1').empty

    def dispose(self) -> None:
        """
        dispose engine
        :return:
        """
        self.engine.dispose()


def db_connect(json_path: str = 'database/database_config.json') -> DataBaseBasic:
    """
    database connection
    :param json_path: str, json file path
    :return: DataBaseBasic
    """
    try:
        with open(json_path, 'r') as f:
            db_setting = json.load(f)
        return DataBaseBasic(**db_setting)
    except FileNotFoundError:
        raise FileNotFoundError(
            f'database config file not found: {json_path}, please check configuration')


def db_connection_test(db: DataBaseBasic) -> str:
    """connection test"""
    return str({"all table name": db.get_all_table_name()})


def create_all_table_by_sql(table_structure_path: str) -> None:
    """
    create all table in table_structure_path
    :param sqls_path: str, sqls path
    :return: None
    """
    db = db_connect()
    for sql_file in os.listdir(table_structure_path):
        if sql_file.endswith('.sql'):
            sql_file_path = os.path.join(table_structure_path, sql_file)
            db.create_table_by_sql_file(sql_file_path)
            print(f'create table: {sql_file}')
        else:
            print(f'ignore file: {sql_file}')
    db.dispose()


def _test():

    db = db_connect()
    print(db.check_table('stock_list'))
    print(db.check_table('stock_basic'))
    db.dispose()

if __name__ == '__main__':
    # from timeit import timeit
    # time_cost = timeit(lambda: create_all_table_by_sql(
    #     'database/table_structures'), number=1)
    # print(f'time cost: {time_cost:.2f} s')
    _test()
