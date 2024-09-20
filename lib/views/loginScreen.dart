import 'package:flutter/material.dart';
import 'package:mvvm_project/utlis/routes/AppRoutes.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/utlis/utlis.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _emailController,
            focusNode: emailFocusNode,
            decoration: InputDecoration(hintText: 'Email'),
            onFieldSubmitted: (value) {
              Utiles.fieldfocusNode(context, emailFocusNode, passwordFocusNode);
            },
          ),

          TextFormField(
            obscureText: _obsecurePassword.value,
            controller: _passwordController,
            focusNode: passwordFocusNode,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: Icon(Icons.visibility_off_outlined),
            ),
          ),

          // InkWell(
          //   onTap: () {
          //     //  Navigator.pushNamed(context, RoutesName.homeScreen);
          //     Utiles.snackBar("message", context);
          //   },
          //   child: Center(
          //     child: Text("click Me"),
          //   ),
          // )
        ],
      ),
    );
  }
}
