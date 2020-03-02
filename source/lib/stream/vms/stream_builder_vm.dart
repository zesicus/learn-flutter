import 'dart:async';

class StreamBuilderVM {
  // 广播流
  StreamController<int> controller = StreamController.broadcast();
  Sink<int> sink;
  int count = 0;

  StreamBuilderVM() {
    sink = controller.sink;
  }
}