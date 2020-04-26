import 'dart:isolate';

class AsyncIsolateVM {

  int count = 0;

  isolateCount(int num) async {
    count = await isolateCountEvent(num);
  }

  static Future<dynamic> isolateCountEvent(int num) async {
    final response = ReceivePort();
    await Isolate.spawn(countEvent4Isolate, response.sendPort);
    final sendPort = await response.first as SendPort;
    final answer = ReceivePort();
    sendPort.send([answer.sendPort, num]);
    return answer.first;
  }

  static countEvent4Isolate(SendPort port) {
    final rPort = ReceivePort();
    port.send(rPort.sendPort);
    rPort.listen((msg) {
      final send = msg[0] as SendPort;
      final n = msg[1] as int;
      send.send(_countEvent(n));
    });
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