import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';

import '../../../constants.dart';

class UserDetailBar extends StatelessWidget {
  const UserDetailBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          child: Icon(
            Icons.person,
            color: Colors.black,
          ),
          backgroundColor: greyColor,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appController.userProfile!.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              appController.userProfile!.email ?? '',
              style: TextStyle(color: greyColor),
            )
          ],
        ),
      ],
    );
  }
}
