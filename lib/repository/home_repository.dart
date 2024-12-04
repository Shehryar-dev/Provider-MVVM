import 'package:flutter/foundation.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/model/meal_model.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/res/api_urls.dart';
import 'package:mvvm/utils/utils.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<MoviesModel> fetchMovieList() async {
    try {
      dynamic response = await _apiServices.getApiResponse(
        AppUrl.movieEndPoint
      );
      return response = MoviesModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Utils.toastMessage(e.toString());
    }
  }
}
