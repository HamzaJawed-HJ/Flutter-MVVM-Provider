import 'package:flutter/material.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/views/homeScreen.dart';
import 'package:mvvm_project/views/loginScreen.dart';
import 'package:mvvm_project/views/signUpScreen.dart';
import 'package:mvvm_project/views/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());

      case RoutesName.signUpScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => Signupscreen());

      case RoutesName.loginScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => Loginscreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => Homescreen());

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const Scaffold(
            body: Column(
              children: [
                Center(
                  child: Text("Defualt SCreen Route"),
                ),
              ],
            ),
          );
        });
    }
  }
}
