import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/order_detail/order_details_controller.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderDetailController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Detail"),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Loading()
            : controller.isError.isTrue
                ? ErrorPage(
                    errorMessage: controller.errorMessage,
                    onRetry: controller.getOrderDetails)
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "#${controller.orderDetail!.id} ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("${controller.orderDetail!.dateOrdered}")
                                ],
                              ),
                              Text(
                                "${controller.orderDetail!.status}" ?? '',
                                style: TextStyle(
                                    color: controller.orderDetail!.status ==
                                            'Delivered'
                                        ? greenColor
                                        : controller.orderDetail!.status ==
                                                'Cancelled'
                                            ? Colors.red
                                            : Colors.blue),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Delivered To"),
                          Text(
                            "${controller.orderDetail!.shippingAddress}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Payment Method"),
                          Text(
                            "${controller.orderDetail!.paymentMethod}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          const Text(
                            "Order Summary",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.builder(
                              itemCount: controller.orderDetail!.items.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                            "${controller.orderDetail!.items[index].product.name} * ${controller.orderDetail!.items[index].quantity} "),
                                        Text(controller.orderDetail!
                                            .items[index].product.unit)
                                      ],
                                    ),
                                    Text(controller
                                        .orderDetail!.items[index].product.price
                                        .toString())
                                  ],
                                );
                              }),
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${controller.orderDetail!.total}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Payment Status: "),
                              controller.orderDetail!.paymentStatus == true
                                  ? const Text(
                                      "PAID",
                                      style: TextStyle(color: greenColor),
                                    )
                                  : const Text(
                                      "Unpaid",
                                      style: TextStyle(color: Colors.red),
                                    )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
