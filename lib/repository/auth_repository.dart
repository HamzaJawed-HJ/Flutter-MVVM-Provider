import 'package:mvvm_project/data/network/baseApiServices.dart';
import 'package:mvvm_project/data/network/networkApiServices.dart';
import 'package:mvvm_project/resources/app_urls.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.postApiResponse(AppUrls.loginEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.postApiResponse(AppUrls.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
