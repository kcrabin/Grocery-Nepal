import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/checkout/checkout_controller.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';

class ShippingAddressEdit extends StatelessWidget {
  String? selectedProvience;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(children: [
            InputField(
              'phone number',
              inputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              controller: controller.phoneController,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Provience'),
              value: selectedProvience,
              onChanged: (String? newValue) {
                controller.selectedProvience = newValue;
              },
              items: controller.proviences
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      child: Text(
                        value,
                      ),
                      value: value,
                    ),
                  )
                  .toList(),
            ),
            InputField(
              'City',
              // inputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              controller: controller.cityController,
            ),
            InputField(
              'Address',
              // inputType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              controller: controller.addressController,
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton('Update', () {
              controller.updateAddress();
            })
          ]),
        ),
      ),
    );
  }
}
