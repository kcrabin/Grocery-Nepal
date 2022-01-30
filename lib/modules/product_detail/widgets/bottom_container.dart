import 'package:flutter/material.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';

import '../../../constants.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline,
              color: Colors.grey,
              size: 30,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: CustomButton('Add to Cart', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Added to cart'),
                    duration: Duration(milliseconds: 2000),
                    backgroundColor: greenColor),
              );
            }),
          )
        ],
      ),
    );
  }
}
