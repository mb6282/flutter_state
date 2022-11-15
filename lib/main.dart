import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider -> 공급자
//Provider는 창고(Repository)에 데이터를 공급
//final numProvider = Provider((_) => 2);

//numProvider는 주소를 들고 있는 것 그래서 주소가 바뀌지 않으므로 final
final numProvider = StateProvider((_) => 2);

void main() {
  runApp(
    // 위젯에서 프로바이더를 사용하고 읽기위해
    // 앱 전체적으로 "ProviderScope" 위젯을 감싸줘야 합니다.
    // 여기에 프로바이더의 상태가 저장됩니다.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: AComponent()),
          Expanded(child: BComponent()),
        ],
      ),
    );
  }
}

// 소비자 : 소비자는 공급자(Provider)에게 데이터를 요청한다.
// 공급자는 창고에서 데이터를 꺼내서 돌려준다.
class AComponent extends ConsumerWidget {
  const AComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref로 provider에게 접근할 수 있음 <- 데이터에 바로 접근하는 것 아님
    //데이터 소비를 한번만 할때 read를 사용
    //watch는 numProvider의 값이 변경될 때 마다 rebuild
    //int num = ref.read(numProvider);
    int num = ref.watch(numProvider);

    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          Text("ACompoent"),
          Expanded(
            child: Align(
              child: Text(
                "${num}",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// 서플라이어 공급자
class BComponent extends ConsumerWidget {
  const BComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Text("BCompoent"),
          Expanded(
            child: Align(
              child: ElevatedButton(
                onPressed: () {
                  //stateProvider일 때만 notifier 사용 가능
                  final result = ref.read(numProvider.notifier);
                  result.state = result.state + 5;
                },
                child: Text(
                  "숫자증가",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
