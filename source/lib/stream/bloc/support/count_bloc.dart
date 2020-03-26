import 'dart:async';
import 'package:learn_flutter/stream/bloc/support/base_bloc_provider.dart';

class CountBLoC extends BaseBloC {
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
