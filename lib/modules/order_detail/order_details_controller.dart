import 'package:get/get.dart';
import 'package:grocery_nepal/data/api/order_api.dart';
import 'package:grocery_nepal/data/models/order/order_details.dart';

class OrderDetailController extends GetxController {
  final isLoading = false.obs;
  final isError = false.obs;
  String errorMessage = '';
  OrderDetail? orderDetail;
  late final int orderId;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is int) {
      orderId = Get.arguments;
      getOrderDetails();
    } else {
      orderDetail = Get.arguments;
    }
  }

  Future<void> getOrderDetails() async {
    isLoading(true);
    isError(false);
    try {
      orderDetail = await OrderApi.getOrderDetail(orderId);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      isError(true);
      print(e.toString());
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = 'Failed to load data.';
      }
    }
  }
}
