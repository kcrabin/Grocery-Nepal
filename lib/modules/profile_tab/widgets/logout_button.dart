import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 100,
        child: Stack(
          children: const [
            Center(
              child: Text(
                'Log Out',
                style: TextStyle(color: greenColor, fontSize: 17),
              ),
            ),
            Icon(
              Icons.logout,
              color: greenColor,
            )
          ],
        ),
      ),
      color: Colors.grey.shade300,
      elevation: 0,
    );
  }
}
