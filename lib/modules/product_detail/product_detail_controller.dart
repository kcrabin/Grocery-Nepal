import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/product/product.dart';

class ProductDetailController extends GetxController {
  final count = 1.obs;
  late final Product product;
  @override
  void onInit() {
    super.onInit();
    product = Get.arguments;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void increment() {
    count.value++;
  }
}
