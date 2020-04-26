import 'package:flutter/foundation.dart';

class AsyncComputeVM {
  int count = 0;

  computeEvent(int num) async {
    count = await compute(_countEvent, num);
  }

  // 计算偶数的个数
  static int _countEvent(int num) {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

}
