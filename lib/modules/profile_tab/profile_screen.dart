import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/auth/change_password/change_password_screen.dart';
import 'package:grocery_nepal/modules/contact_us/contact_us_screen.dart';
import 'package:grocery_nepal/modules/edit_details/edit_details_screen.dart';
import 'package:grocery_nepal/modules/favourites/favourites_screen.dart';
import 'package:grocery_nepal/modules/profile_tab/about_us/about_us_screen.dart';

import 'package:grocery_nepal/modules/profile_tab/widgets/item_tile.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/logout_button.dart';

import 'widgets/user_detail_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
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
                      return FavouriteScreen();
                    },
                  ),
                );
              },
            ),
            ItemTile(
              icon: Icons.feed_outlined,
              label: 'Edit Profile',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EditDetails();
                    },
                  ),
                );
              },
            ),
            ItemTile(
              icon: Icons.lock_outline,
              label: 'Change Password',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChangePasswordScreen();
                    },
                  ),
                );
              },
            ),
            ItemTile(
              icon: Icons.info_outline,
              label: 'About Us',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutUs();
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
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
