import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state/pages/product.dart';

final productProvider =
    StateNotifierProvider<ProductRepository, Product>((ref) {
  return ProductRepository();
});

class ProductRepository extends StateNotifier<Product> {
  //fetch가 안 되는 이유 : dart는 new되면 바로 super를 타고 올라감 = fetch가 아직 띄워지지 않음
  //java는 스택을 다 실행한 뒤 객체가 만들어지나
  ProductRepository() : super(Product(1, "바나나", 1000));
}
