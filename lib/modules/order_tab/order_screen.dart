import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/data/models/order/order.dart';
import 'package:grocery_nepal/modules/order_tab/order_controller.dart';
import 'package:grocery_nepal/modules/order_tab/widgets/order_tile.dart';
import 'package:grocery_nepal/modules/order_tab/widgets/status_bar.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/login_button.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _selectedStatus = 0;
  late final PageController _pageController;
  final controller = Get.find<OrderController>();
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  Widget getOrders(String status) {
    List<Order> selectedOrders = [];
    if (status == 'All') {
      selectedOrders = controller.orders;
    } else {
      for (Order order in controller.orders) {
        if (order.status == status) {
          selectedOrders.add(order);
        }
      }
    }
    return selectedOrders.isEmpty
        ? const Center(
            child: Text('No Orders'),
          )
        : ListView.builder(
            itemCount: selectedOrders.length,
            itemBuilder: (context, index) {
              return OrderTile(selectedOrders[index]);
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order History'),
        ),
        body: Obx(
          () => Get.find<AppController>().isLoggedIn.isTrue
              ? controller.isLoading.isTrue
                  ? const Loading()
                  : Column(
                      children: [
                        StatusBar(
                          onPress: (int index) {
                            setState(() {
                              _selectedStatus = index;
                            });
                            _pageController.jumpToPage(
                              index,
                            );
                          },
                          selectedIndex: _selectedStatus,
                        ),
                        Expanded(
                            child: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _selectedStatus = index;
                            });
                          },
                          children: [
                            getOrders('All'),
                            getOrders('Pending'),
                            getOrders('Processing'),
                            getOrders('Delivered'),
                            getOrders('Cancelled'),
                          ],
                        )),
                      ],
                    )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Login to view your order history',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      LoginButton()
                    ],
                  ),
                ),
        ));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
