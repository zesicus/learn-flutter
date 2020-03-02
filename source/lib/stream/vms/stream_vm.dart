import 'dart:async';

class StreamVM {
  // 单订阅
  final StreamController streamController = StreamController();
  Sink sink;
  // 广播
  final bsController = StreamController();
  Stream bs;
  Sink bSink;

  var timer;
  StreamVM() {
    bs = bsController.stream.asBroadcastStream();
    sink = streamController.sink
    ..add('123\n')
    ..add('abc\n');
    bSink = bsController.sink
    ..add('我是广播');
    timer = Timer.periodic(Duration(seconds: 3), (_) {
      streamController.sink.add('循环打印\n另一条信息\n');
      bsController.sink.add('广播打印');
    });
  }
}
