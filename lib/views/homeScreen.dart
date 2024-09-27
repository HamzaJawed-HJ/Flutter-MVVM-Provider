import 'package:flutter/material.dart';
import 'package:mvvm_project/utlis/routes/AppRoutes.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  UserViewModel userViewModel = UserViewModel();

  @override
  Widget build(BuildContext context) {
    final userViewModelProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Column(
        children: [
          Center(
            child: InkWell(
                onTap: () {
                  userViewModelProvider.removeUser().then((val) {
                    Navigator.popAndPushNamed(context, RoutesName.loginScreen);
                  });
                },
                child: Text("Logout")),
          )
        ],
      ),
    );
  }
}
