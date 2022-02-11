import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/auth/login/login_screen.dart';
import 'package:grocery_nepal/modules/auth/register/register_screen.dart';
import 'package:grocery_nepal/modules/home/home_screen.dart';
import 'package:grocery_nepal/modules/order_tab/order_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPref));
}

class MyApp extends StatelessWidget {
  const MyApp(
    this.sharedPreferences,
  );

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'grocery nepal',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: const AppBarTheme(
              // systemOverlayStyle: SystemUiOverlayStyle(
              //   statusBarColor: Theme.of(context).scaffoldBackgroundColor,
              //   statusBarIconBrightness: Brightness.dark,
              //   statusBarBrightness: Brightness.light,
              // ),
              color: greenColor,
              elevation: 1,
              // titleTextStyle: TextStyle(
              //   color: Colors.black,
              //   fontWeight: FontWeight.w600,
              //   fontSize: 18,
              // ),
              centerTitle: true),
        ),
        // home: const HomeScreen(),

        initialBinding: BindingsBuilder(() {
          Get.put(OrderController());
          Get.put(AppController(sharedPreferences), permanent: true);
        }),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => RegisterScreen(),
        });
  }
}
