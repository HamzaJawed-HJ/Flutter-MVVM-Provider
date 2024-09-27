import 'package:flutter/material.dart';
import 'package:mvvm_project/resources/colors.dart';
import 'package:mvvm_project/resources/widgets/button_widget.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/utlis/utlis.dart';
import 'package:mvvm_project/viewModel/auth_view_model.dart';
import 'package:mvvm_project/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

//IN STATELESS CLASS THERE IS NO INITSTATE OR DISPOSE

  @override
  Widget build(BuildContext context) {
    final authViewModelProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
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
              keyboardType: TextInputType.emailAddress,
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
              title: "Login",
              isLoading: authViewModelProvider.isLoading,
              onTap: () {
                if (_emailController.text.isEmpty) {
                  Utiles.snackBar("Please Enter Email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utiles.snackBar("Please Enter Password", context);
                } else {
                  Map data = {
                    "email": "eve.holt@reqres.in",
                    "password": "cityslicka"
                  };

                  // Map data = {
                  //   'email': _emailController.text.toString(),
                  //   'password': _passwordController.text.toString()
                  // };

                  authViewModelProvider.loginApi(data, context);

                  // userViewModelProvider.saveUser;

                  print('Api hit');
                }
              },
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.signUpScreen);
              },
              child: Center(
                child: Text("Dont Have an account! SignUp"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
