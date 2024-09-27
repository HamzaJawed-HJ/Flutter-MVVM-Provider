import 'package:flutter/foundation.dart';
import 'package:mvvm_project/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  Future<bool> saveUser(String value) async {
    UserModel user = UserModel();
    user.token = value;
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();

    sharedPreference.setString('token', user.token.toString());

    notifyListeners();

    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final String? token = sharedPreference.getString('token');

    // print("SAVED TO TOKEN: $token");

    return UserModel(
      token: token.toString(),
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();

    final remove = sharedPreference.remove('token');

    return remove;
  }
}
