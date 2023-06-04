"""
tushare token setting
"""

import json

import tushare as ts


def set_token(json_path: str = 'download/tushare_config.json') -> None:
    """
    set tushare token
    :param json_path: str, tushare token json file path
    :return: None
    """
    with open(json_path, 'r') as f:
        tushare_setting = json.load(f)
    ts.set_token(tushare_setting['token'])


def update_token(token: str, json_path: str = 'download/tushare_config.json') -> None:
    """
    update tushare token
    :param token: str, tushare token
    :param json_path: str, tushare token json file path
    :return: None
    """
    with open(json_path, 'r') as f:
        tushare_setting = json.load(f)
    if token != tushare_setting['token']:
        tushare_setting['token'] = token
        with open(json_path, 'w') as f:
            json.dump(tushare_setting, f)
            

def _test():
    update_token(token='8048cbf9b5b32cf6c5ca12b8863a1869901b566749dccbd796b458b5')
    set_token()


if __name__ == '__main__':
    _test()
