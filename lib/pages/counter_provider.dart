// int<뒷자리 결과값
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state/pages/counter_repository.dart';

final counterProvider = StateNotifierProvider<CounterRepository, int>((ref) {
  return CounterRepository();
});
