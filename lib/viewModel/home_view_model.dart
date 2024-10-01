import 'package:flutter/material.dart';
import 'package:mvvm_project/data/model/movies_list_model.dart';
import 'package:mvvm_project/data/response/api_response.dart';
import 'package:mvvm_project/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final homeRepository = HomeRepository();

  ApiResponse<MoviesModel> movieList = ApiResponse.loading();

  void setMovieList(ApiResponse<MoviesModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> movieListApi() async {
    await homeRepository.fetchMovieList().then((val) {
      setMovieList(ApiResponse.completed(val));
      print("API HITING " + val.toString());
    }).onError((error, stackTrace) {
      ApiResponse.error(error.toString());

      print("API NOT HITTING "+error.toString());
    });
  }
}
