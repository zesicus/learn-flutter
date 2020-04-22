import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteVM {

  Database _database;
  TextEditingController idFieldController = TextEditingController();
  TextEditingController nameFieldController = TextEditingController();

  dispose() {
    _database.close();
  }

  // 初始化后打开数据库
  Future<String> openDB() async {
    File file = await _getDBFile();
    _database = await openDatabase(file.path);
    return "打开数据库路径 ${file.path}\n";
  }

  // 打开数据库后新建表
  Future<String> createTable() async {
    var echo = "检查是否存在数据表...\n";
    if (await _tableExist()) {
      // 表存在
      echo += "存在表 sny_user";
    } else {
      echo += "不存在表\n";
      String sql = '''
      create table sny_user (
        user_id integer primary key,
        user_name text not null
      )
      ''';
      await _database.execute(sql);
      echo += "已创建新表 sny_user\n";
    }
    return echo;
  }
  
  // 重建数据库
  Future<String> recreateDB() async {
    await _database.close();
    var txt = "";
    File file = await _getDBFile();
    if (await file.exists()) {
      await deleteDatabase(file.path);
    }
    _database = await openDatabase(file.path);
    txt += "重建数据库路径 ${file.path}\n";
    var tableTxt = await createTable();
    txt += tableTxt;
    return txt;
  }

  // 增
  Future<String> addData(int id, String name) async {
    String sql = "insert into sny_user(user_id, user_name) values(?, ?)";
    int count = 0;
    await _database.transaction((txn) async {
      count = await txn.rawInsert(sql, [id, name]);
    });
    return count > 0 ? "\n已插入用户 ID: $id，用户名：$name" : "\n插入失败，可能用户ID重复";
  }

  // 删
  Future<String> delData(int id) async {
    String sql = "delete from sny_user where user_id=?";
    int count = await _database.rawDelete(sql, [id]);
    return count > 0 ? "\n已删除ID为 $id 的用户" : "\n未找到该用户";
  }

  // 改
  Future<String> modifyData(int id, String name) async {
    String sql = "update sny_user set user_name=? where user_id=?";
    int count = await _database.rawUpdate(sql, [name, id]);
    return count > 0 ? "\n已修改用户ID $id 名字为 $name" : "\n修改未成功";
  }

  // 查ID
  Future<String> queryOne(int id) async {
    String sql = "select * from sny_user where user_id=?";
    final result = await _database.rawQuery(sql, [id]);
    return "\nID $id 查询到的结果为\n${result.toString()}";
  }

  // 查所有
  Future<String> queryMore() async {
    String sql = "select * from sny_user";
    final result = await _database.rawQuery(sql);
    return "\n当前表中所有数据为:\n${result.toString()}";
  }

  // MARK: - Private Utils

  // 判断表是否存在
  Future<bool> _tableExist() async {
    // sqlite_master
    String sql = "select * from sqlite_master where type = 'table' and name = 'sny_user'";
    var res = await _database.rawQuery(sql);
    return (res != null && res.length > 0);
  }

  // 获取数据库路径
  Future<File> _getDBFile() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = '${documentsDir.path}/default.db';
    File file = File(path);
    return file;
  }

}