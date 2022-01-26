import 'package:flutter/material.dart';

import '../../../constants.dart';

class SerchBar extends StatelessWidget {
  const SerchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: const [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Text(
            'Search products',
            style: TextStyle(color: greyColor),
          ),
        ],
      ),
    );
  }
}
