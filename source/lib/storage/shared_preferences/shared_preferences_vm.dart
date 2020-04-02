import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SPResult {
  noKey,
  noValue,
  success,
}

class SharedPreferencesVM {
  final TextEditingController keyTC = TextEditingController();
  final TextEditingController valueTC = TextEditingController();
  String sharedReadContent = "";
  String get shareKey => keyTC.value.text;
  String get shareValue => valueTC.value.text;

  // 写入 Share Preference
  Future<SPResult> writeToShare() async {
    if (shareKey == null || shareKey.isEmpty) {
      return SPResult.noKey;
    } else if (shareValue == null || shareValue.isEmpty) {
      return SPResult.noValue;
    } else {
      final sp = await SharedPreferences.getInstance();
      await sp.setString(shareKey, shareValue);
      return SPResult.success;
    }
  }

  // 读取 Share Preference
  Future<SPResult> readFromShare() async {
    if (shareKey == null || shareKey.isEmpty) {
      return SPResult.noKey;
    } else {
      final sp = await SharedPreferences.getInstance();
      sharedReadContent = sp.getString(shareKey);
      return SPResult.success;
    }
  }

  // 删除
  Future<SPResult> delFromShare() async {
    if (shareKey == null || shareKey.isEmpty) {
      return SPResult.noKey;
    } else {
      final sp = await SharedPreferences.getInstance();
      await sp.remove(shareKey);
      sharedReadContent = sp.getString(shareKey);
      return SPResult.success;
    }
  }
}