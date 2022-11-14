import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
    double size = MediaQuery.of(context).size.width;
    double ABsize = size * 0.6;
    double Csize = size * 0.4;
    return Scaffold(
      body: Row(
        children: [
          SizedBox(width: ABsize, child: ABComponent()),
          SizedBox(width: Csize, child: CComponent()),
        ],
      ),
    );
  }
}

class ABComponent extends StatefulWidget {
  const ABComponent({Key? key}) : super(key: key);
  @override
  State<ABComponent> createState() => _ABComponentState();
}

class _ABComponentState extends State<ABComponent> {
  int num = 1;

  void increase() {
    setState(() {
      num++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: AComponent(num)),
          Expanded(child: BComponent(increase)),
        ],
      ),
    );
  }
}

//컨슈머 (소비자)
class AComponent extends StatelessWidget {
  final int num;
  const AComponent(this.num, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

//서플라이어 (공급자)
class BComponent extends StatelessWidget {
  final Function increase;
  const BComponent(this.increase, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Text("BCompoent"),
          Expanded(
            child: Align(
              child: ElevatedButton(
                onPressed: () {
                  increase();
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

class CComponent extends StatelessWidget {
  const CComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
