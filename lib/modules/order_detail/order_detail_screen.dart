import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Detail"),
      ),
      body: SingleChildScrollView(
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
                        "#2311",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("1 Feb 2022")
                    ],
                  ),
                  Text(
                    "Delivered",
                    style: TextStyle(color: greenColor),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Delivered To"),
              Text(
                "Pokhara, Nepal",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Payment Method"),
              Text(
                "Khalti",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Text(
                "Order Summary",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [Text("Cabbage X2"), Text("1 Kg")],
                        ),
                        Text("Rs. 200")
                      ],
                    );
                  }),
              Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rs. 1500",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment Status: "),
                  Text(
                    "PAID",
                    style: TextStyle(color: greenColor),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
