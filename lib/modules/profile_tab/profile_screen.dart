import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/modules/auth/change_password/change_password_screen.dart';
// import 'package:grocery_nepal/modules/edit_details/edit_details_screen.dart';
import 'package:grocery_nepal/modules/favourites/favourites_screen.dart';
import 'package:grocery_nepal/modules/profile_tab/about_us/about_us_screen.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/profile_tab/edit_profile/edit_profile_screen.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/item_tile.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/login_button.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/logout_button.dart';

import 'contact_us/contact_us_screen.dart';
import 'widgets/user_detail_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => appController.isLoggedIn.isFalse
                    ? const Divider(
                        thickness: 1,
                      )
                    : Column(
                        children: [
                          const UserDetailBar(),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          ItemTile(
                            icon: Icons.favorite_outline_outlined,
                            label: 'Favourites',
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const FavouriteScreen();
                                  },
                                ),
                              );
                            },
                          ),
                          ItemTile(
                            icon: Icons.edit,
                            label: 'Edit Profile',
                            onPress: () {
                              Get.to(() => const EditProfileScreen());
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              // return const EditDetails();
                              //     },
                              //   ),
                              // );
                            },
                          ),
                          ItemTile(
                            icon: Icons.lock_outline,
                            label: 'Change Password',
                            onPress: () {
                              Get.to(() => const ChangePasswordScreen());
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return const ChangePasswordScreen();
                              //     },
                              //   ),
                              // );
                            },
                          ),
                        ],
                      ),
              ),
              ItemTile(
                icon: Icons.info_outline,
                label: 'About Us',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AboutUs();
                      },
                    ),
                  );
                },
              ),
              ItemTile(
                icon: Icons.feedback_outlined,
                label: 'Contact Us',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ContactUs();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(() => appController.isLoggedIn.isFalse
                  ? const LoginButton()
                  : const LogoutButton()),
            ],
          ),
        ),
      ),
    );
  }
}
