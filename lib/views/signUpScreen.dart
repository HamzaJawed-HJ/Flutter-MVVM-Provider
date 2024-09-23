import 'package:flutter/material.dart';
import 'package:mvvm_project/resources/colors.dart';
import 'package:mvvm_project/resources/widgets/button_widget.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/utlis/utlis.dart';
import 'package:mvvm_project/viewModel/auth_view_model.dart';
import 'package:provider/provider.dart';

class Signupscreen extends StatelessWidget {
  Signupscreen({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();

  //   _obsecurePassword.dispose();

  //   emailFocusNode.dispose();
  //   passwordFocusNode.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final AuthViewModelProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Screen"),
        centerTitle: true,
        backgroundColor: AppColors.lightBlueColor.withOpacity(.7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onFieldSubmitted: (value) {
                Utiles.fieldfocusNode(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (BuildContext context, bool value, Widget? child) =>
                  TextFormField(
                obscureText: _obsecurePassword.value,
                controller: _passwordController,
                focusNode: passwordFocusNode,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  labelText: 'password',
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      _obsecurePassword.value = !_obsecurePassword.value;
                    },
                    child: Icon(_obsecurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ButtonWidget(
                title: "SignUp",
                isLoading: AuthViewModelProvider.isLoading,
                onTap: () {
                  if (_emailController.text.isEmpty) {
                    Utiles.snackBar("Please Enter Email", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utiles.snackBar("Please Enter Password", context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString()
                    };

                    AuthViewModelProvider.signUpApi(data, context);
                  }
                }),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.loginScreen);
              },
              child: Center(
                child: Text("Already Have an account! Let's Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
