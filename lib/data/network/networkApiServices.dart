import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_project/data/app_exceptions.dart';
import 'package:mvvm_project/data/network/baseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 20));
      responseJson = checkReturnResponse(response);
    } on SocketException {
      throw FetchDataExcaeption("No Internet ");
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
              Uri.parse(
                url,
              ),
              body: data)
          .timeout(Duration(seconds: 10));
      responseJson = checkReturnResponse(response);
    } on SocketException {
      throw FetchDataExcaeption("No Internet ");
    }
    return responseJson;
  }

  dynamic checkReturnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);

        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataExcaeption(
            "server Error with status code ${response.statusCode.toString()}");
    }
  }
}
