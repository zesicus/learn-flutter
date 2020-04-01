import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageFilesVM {
  // 注：此处的低效只是手痒想用下 map 而已
  final _radioText = {
    'Temporary Dictionary': 'Path to the temporary dictionary on the device.',
    'Documents Dictionary': 'Path to a directory where the application place files that are private to application.',
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

  // 写入文件信息
  writeTextIntoFile() async {
    if (currentValue == radioTitles[2]) {
      // 调用安卓外部存储需要权限
      if (await Permission.storage.request().isGranted) {
        // 已授权
        
      } else {
        
      }
    }
  }

  // 文本写入文件

  // 读取文件信息

}
