import 'dart:async';

class CountBLoC {
  int _count = 0;
  StreamController<int> _countController = StreamController<int>.broadcast();
  Stream<int> get stream => _countController.stream;
  int get value => _count;

  increase() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }
}
