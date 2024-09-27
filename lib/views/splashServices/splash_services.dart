import 'package:flutter/material.dart';
import 'package:mvvm_project/data/model/user_model.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/viewModel/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        print(value.token.toString());
        await Future.delayed(Duration(seconds: 5));
        Navigator.pushNamed(context, RoutesName.loginScreen);
      } else {
        await Future.delayed(Duration(seconds: 5));
        print(value.token.toString());
        Navigator.pushNamed(context, RoutesName.homeScreen);
      }
    });
  }
}
