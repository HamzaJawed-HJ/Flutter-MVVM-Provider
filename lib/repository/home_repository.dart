import 'package:mvvm_project/data/model/movies_list_model.dart';
import 'package:mvvm_project/data/network/baseApiServices.dart';
import 'package:mvvm_project/data/network/networkApiServices.dart';
import 'package:mvvm_project/resources/app_urls.dart';

class HomeRepository {
  BaseApiServices apiServices = NetworkApiServices();

  Future<MoviesModel> fetchMovieList() async {
    dynamic jsonResponse =
        await apiServices.getApiResponse(AppUrls.movieEndPoint);

    return jsonResponse = MoviesModel.fromJson(jsonResponse);
  }
}
