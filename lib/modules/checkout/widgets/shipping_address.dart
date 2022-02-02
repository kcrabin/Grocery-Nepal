import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/checkout/shipping_address/shipping_address_edit.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  Widget getAddressRow({required String label, required String data}) {
    return Row(
      children: [
        Expanded(
            child: Text(
          label,
          style: TextStyle(color: Colors.grey.shade600),
        )),
        Expanded(
            child: Text(
          data,
          style: TextStyle(color: Colors.grey.shade600),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Address",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ShippingAddressEdit();
                    }));
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(color: greenColor),
                  ))
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenColor.withOpacity(0.1),
            ),
            child: Column(
              children: [
                getAddressRow(label: "PhoneNumber: ", data: "9876237312"),
                getAddressRow(label: "Province: ", data: "Gandaki"),
                getAddressRow(label: "City: ", data: "Pokhara"),
                getAddressRow(label: "PhoneNumber", data: "9876237312"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
