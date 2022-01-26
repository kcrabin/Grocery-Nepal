import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/order.dart';
import 'package:grocery_nepal/modules/order_tab/widgets/order_tile.dart';
import 'package:grocery_nepal/modules/order_tab/widgets/status_bar.dart';

final List<Order> orders = List.generate(
  20,
  (index) => Order(
      id: index,
      date: DateTime.now().toString(),
      status: (index % 5) == 0
          ? 'Processing'
          : (index % 4) == 0
              ? 'Cancelled'
              : (index % 3) == 0
                  ? 'Delivered'
                  : 'Pending',
      total: 100 * index),
);

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  Widget getOrders(String status) {
    List<Order> selectedOrders = [];
    if (status == 'All') {
      selectedOrders = orders;
    } else {
      for (Order order in orders) {
        if (order.status == status) {
          selectedOrders.add(order);
        }
      }
    }
    return ListView.builder(
        itemCount: selectedOrders.length,
        itemBuilder: (context, index) {
          return OrderTile(
            order: selectedOrders[index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: Column(
        children: [
          StatusBar(
            selectedIndex: selectedIndex,
            onPressed: (int index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.jumpToPage(index);
            },
          ),
          Expanded(
              child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                  children: [
                getOrders('All'),
                getOrders('Pending'),
                getOrders('Processing'),
                getOrders('Delivered'),
                getOrders('Cancelled'),
              ])),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
