
import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = CounterBase with _$CounterStore;

abstract class CounterBase with Store {
  @readonly
  int _value = 0;

  @action
  void increment() {
    _value++;
  }
}