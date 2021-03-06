#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import logging
import sys_path

from common import logging_config
from common import config_parser
import table_struct
import mysql_wrapper

logger = logging_config.dbLogger()
logger.setLevel(logging.INFO)

def select_all_task_run_history():
    '''
    Select all task run history record

    return rows/list()
    '''
    table = table_struct.T_TASK_RUN_HISTORY
    condition_str = '1=1'
    mysql = mysql_wrapper.MysqlWrapper()
    rows = mysql.select_with_condition(table, condition_str)
    if len(rows) == 0:
        logger.error('Select all task run history get empty rows')
        return list()
    return rows

def select_task_run_history(cond_map, fields = '*'):
    '''
    With by condition map select task run history record

    @cond_map = {
        'task_id': ...
        'task_name': ...
        ...
    }
    @fields: select fields, default equal *

    return rows/list()
    '''
    table = table_struct.T_TASK_RUN_HISTORY
    # do select
    mysql = mysql_wrapper.MysqlWrapper()
    rows = mysql.select(table, cond_map, fields)
    if len(rows) == 0:
        logger.error('Select task run history get empty rows')
        return list()
    return rows

def add_task_run_history(cond_map):
    '''
    Add new task run history record

    @cond_map = {
        'task_id': ...
        'task_name': ...
        ...
    }

    return True/False
    '''
    table = table_struct.T_TASK_RUN_HISTORY
    mysql = mysql_wrapper.MysqlWrapper()
    # do select
    rows = select_task_run_history(cond_map)
    if len(rows) != 0:
        logger.warn('Has task run history in mysql.')
        return True
    # do insert
    succ = mysql.insert(table, cond_map)
    if succ is False:
        logger.error('Add task run history fail.')
        return False
    return True

def update_task_run_history(new_value_map, cond_map):
    '''
    update task run history record

    @new_value_map = {
        'task_id': ...
        'task_name': ...
        ...
    }
    @cond_map = {
        'task_id': ...
        'task_name': ...
        ...
    }

    return True/False
    '''
    table = table_struct.T_TASK_RUN_HISTORY
    mysql = mysql_wrapper.MysqlWrapper()
    succ = mysql.update(table, new_value_map, cond_map)
    if succ is False:
        logger.error('Update task run history fail.')
        return False
    return True

def delete_task_run_history(cond_map):
    '''
    delete task run history record

    @cond_map = {
        'task_id': ...
        'task_name': ...
        ...
    }

    return True/False
    '''
    table = table_struct.T_TASK_RUN_HISTORY
    mysql = mysql_wrapper.MysqlWrapper()
    succ = mysql.delete(table, cond_map)
    if succ is False:
        logger.error('Delete task run history fail.')
        return False
    return True
