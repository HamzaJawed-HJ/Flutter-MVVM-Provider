import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/repository/auth_repository.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/utlis/utlis.dart';

class AuthViewModel with ChangeNotifier {
  final authRepository = AuthRepository();

  bool isLoading = false;

  bool isSignUpLoading = false;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    isSignUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    authRepository.loginApi(data).then((val) {
      setLoading(false);
      Utiles.snackBar("Login Sucessfull", context);
      // Navigator.pushNamed(context, RoutesName.homeScreen);
      if (kDebugMode) {
        print(val.toString());
      }
    }).onError((error, StackTrace) {
      setLoading(false);
      Utiles.toastMessage("EnterCorrect emal pass ${error.toString()}");
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    authRepository.signUpApi(data).then((val) {
      setSignUpLoading(false);
      Utiles.snackBar("SignUp Sucessfull", context);
      Navigator.pushNamed(context, RoutesName.homeScreen);
      if (kDebugMode) {
        print(val.toString());
      }
    }).onError((error, StackTrace) {
      Utiles.toastMessage(error.toString());
    });
  }
}
