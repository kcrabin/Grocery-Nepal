import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

import 'edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              InputField(
                'Full Name',
                inputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: controller.nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                'Email',
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                controller: controller.emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? const Loading(
                        size: 100,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton('Edit', controller.editProfile),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
