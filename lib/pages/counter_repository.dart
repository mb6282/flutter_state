import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterRepository extends StateNotifier<int> {
  CounterRepository() : super(0);
  void increment() {
    state = state + 1;
  }
}
