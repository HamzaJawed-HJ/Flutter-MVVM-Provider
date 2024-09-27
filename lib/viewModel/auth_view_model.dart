import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/data/model/user_model.dart';
import 'package:mvvm_project/repository/auth_repository.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/utlis/utlis.dart';
import 'package:mvvm_project/viewModel/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final authRepository = AuthRepository();
  final userViewModel = UserViewModel();

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

    authRepository.loginApi(data).then(
      (value) {
        setLoading(false);
        Utiles.snackBar(
            "Login Sucessful & Token: ${value.toString()}", context);
        Navigator.pushNamed(context, RoutesName.homeScreen);
        userViewModel.saveUser(value.toString());

        if (kDebugMode) {
          print(
            value.toString(),
          );
        }
      },
    ).onError(
      (error, StackTrace) {
        setLoading(false);
        if (kDebugMode) {
          print(
            error.toString(),
          );
        }
      },
    );
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    authRepository.signUpApi(data).then((val) {
      setSignUpLoading(false);
      Utiles.snackBar("SignUp Sucessfull", context);
      Navigator.pushNamed(context, RoutesName.loginScreen);

      if (kDebugMode) {
        print(val.toString());
      }
    }).onError((error, StackTrace) {
      Utiles.toastMessage(error.toString());
    });
  }
}
