import 'package:flutter/material.dart';
import 'package:mvvm_project/utlis/routes/AppRoutes.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.homeScreen);
              },
              child: Center(
                child: Text("click Me"),
              ))
        ],
      ),
    );
  }
}
