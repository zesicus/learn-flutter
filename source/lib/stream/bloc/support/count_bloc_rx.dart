import 'package:learn_flutter/stream/bloc/support/base_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class  CountBLoCRx extends BaseBloC {
  int _count = 0;
  var _subject = BehaviorSubject<int>();
  Stream<int> get stream => _subject.stream;
  int get value => _count;

  increase() {
    _subject.add(++_count);
  }

  dispose() {
    _subject.close();
  }
}