import 'package:flutter/material.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';

class ShippingAddressEdit extends StatefulWidget {
  ShippingAddressEdit({Key? key}) : super(key: key);

  @override
  State<ShippingAddressEdit> createState() => _ShippingAddressEditState();
}

class _ShippingAddressEditState extends State<ShippingAddressEdit> {
  final List<String> proviences = [
    'province 1',
    'Madesh ',
    'Bagmati ',
    'Gandaki',
    'Lumbini',
    'Karnali',
    'Sudurpaschhim',
  ];

  String? selectedProvience;

  @override
  Widget build(BuildContext context) {
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
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Provience'),
              value: selectedProvience,
              onChanged: (String? newValue) {
                setState(() {
                  selectedProvience = newValue;
                });
              },
              items: proviences
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
            ),
            InputField(
              'Address',
              // inputType: TextInputType.phone,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton('Update', () {
              Navigator.pop(context);
            })
          ]),
        ),
      ),
    );
  }
}
