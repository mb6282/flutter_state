import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state/pages/counter_provider.dart';
import 'package:flutter_state/pages/product.dart';
import 'package:flutter_state/pages/product_list_repository.dart';
import 'package:flutter_state/pages/product_repository.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final product = ref.watch(productProvider);
    final productList = ref.watch(productListProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${productList[index].name}"),
                  subtitle: Text("${productList[index].price}"),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final p1 = ref.read(productListProvider.notifier);
              //상태변경을 못하고 깊은복사 하는걸해야함
              p1.state = [...p1.state, Product(4, "고구마", 5000)];
            },
            child: Text(
              "상품추가",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "${count}",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
          ),
          Text(
            "${product.name}",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
