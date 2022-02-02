// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/order.dart';
import 'package:grocery_nepal/modules/history_tab/widgets/order_history_tile.dart';
import 'package:grocery_nepal/modules/history_tab/widgets/status_bar.dart';

final List<Order> orders = List.generate(
    10,
    (index) => Order(
        id: index,
        date: DateTime.now().toString(),
        status: index % 5 == 0
            ? "Processing"
            : index % 4 == 0
                ? "Pending"
                : index % 3 == 0
                    ? "Cancelled"
                    : "Delivered",
        total: index * 100));

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int selectedIndex = 0;
  final PageController _controller = PageController();

  Widget getOrders(String status) {
    List<Order> selectedOrders = [];
    if (status == "All") {
      selectedOrders = orders;
    } else {
      for (Order order in orders) {
        if (order.status == status) {
          selectedOrders.add(order);
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: selectedOrders.length,
        itemBuilder: (context, index) {
          return OrderHistoryTile(selectedOrders[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StatusBar(
              onPressed: (index) {
                setState(() {
                  selectedIndex = index;
                });
                _controller.jumpToPage(index);
              },
              selectedIndex: selectedIndex,
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: [
                getOrders("All"),
                getOrders("Pending"),
                getOrders("Processing"),
                getOrders("Delivered"),
                getOrders("Cancelled"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
