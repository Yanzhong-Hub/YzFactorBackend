"""
config.py

- database config reset
- read database config
"""

import json


def read_config() -> dict[str, str|int]:
    """
    Read database config from database_config.json
    :return: ditc, database config
    """
    with open('database/database_config.json', 'r') as f:
        config = json.load(f)
    return config


def set_config(username: str,
               password: str,
               host: str,
               port: int,) -> None:
    """
    Reset database config
    :param username: str, username
    :param password: str, password
    :param host: str, host
    :param port: int, port
    """
    config = {
        "engine": "pymysql",
        "database": "Tushare",
        "username": username,
        "password": password,
        "host": host,
        "port": port
    }
    with open('database/database_config.json', 'w') as f:
        json.dump(config, f, indent=4)


def _test() -> None:
    # test for read config
    json_config_old = read_config()
    print(f'old configs: {json_config_old}')

    # test for reset config
    set_config(username='root',
               password='123456',
               host='localhost',
               port=3306)

    json_config_new = read_config()
    print(f'new configs: {json_config_new}')

    # change back to old config
    set_config(username=json_config_old['username'],  # type: ignore
               password=json_config_old['password'],  # type: ignore
               host=json_config_old['host'],  # type: ignore
               port=json_config_old['port'])  # type: ignore


if __name__ == '__main__':
    from timeit import timeit
    time_cost = timeit(_test, number=1)
    print(f'time cost: {time_cost:.2f}')
