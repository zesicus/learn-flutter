import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class StorageFilesVM {
  // 注：此处的低效只是手痒想用下 map 而已
  final _radioText = {
    'Temporary Dictionary': 'Path to the temporary dictionary on the device.',
    'Documents Dictionary':
        'Path to a directory where the application place files that are private to application.',
    'External Storage Directory': '外置存储，安卓可用需获取权限，iOS 不可用。',
  };
  List get radioTitles => _radioText.keys.map((value) => value).toList();
  List get radioDescs => _radioText.values.map((value) => value).toList();
  // 当前存储方式选项
  var currentValue = 'Temporary Dictionary';

  TextEditingController editingController = TextEditingController();
  // 读取内容
  String fileContent = "";

  dispose() {
    editingController.dispose();
  }

  // 写入文件权限判断
  Future<bool> writeTextIntoFile() async {
    if (currentValue == radioTitles[2]) {
      // 调用安卓外部存储需要权限
      if (await Permission.storage.request().isGranted) {
        // 已授权
        return _writeContent();
      } else {
        return false;
      }
    } else {
      return _writeContent();
    }
  }

  // 文本写入文件
  Future<bool> _writeContent() async {
    var text = editingController.value.text;
    // 获取对应文件
    String filePath = await _getFilePath();

    if (filePath != null) {
      File file = File(filePath);
      if (text == null || text.isEmpty) {
        return false;
      } else {
        // 内容不空，则判断是否已存在，存在先删除，重新创建后写入信息
        if (await file.exists()) {
          file.deleteSync();
        }
        file.createSync();
        file.writeAsStringSync(text);
        editingController.clear();
        return true;
      }
    } else {
      return false;
    }
  }

  // 获取文件存储路径
  Future<String> _getFilePath() async {
    // 设置默认路径为临时目录
    String dir = (await getTemporaryDirectory()).path;
    switch (currentValue) {
      case 'Temporary Dictionary':
        dir = (await getTemporaryDirectory()).path;
        break;
      case 'Documents Dictionary':
        dir = (await getApplicationDocumentsDirectory()).path;
        break;
      case 'External Storage Directory':
        if (Platform.isAndroid) {
          dir = (await getExternalStorageDirectory()).path;
        } else {
          // iOS 不存在外部目录，设置为临时目录
          dir = (await getTemporaryDirectory()).path;
        }
        break;
      default:
        return null;
        break;
    }
    return '$dir/store.txt';
  }

  // 读取文件信息
  readTextFromFile() async {
    File file = File(await _getFilePath());
    if (await file.exists()) {
      fileContent = file.readAsStringSync();
    } else {
      fileContent = null;
    }
  }
}
