import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier{
  final _myRepo = HomeRepository();
  ApiResponse<MoviesModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesModel> response){
    moviesList = response;
    notifyListeners();
  }


  Future<dynamic> fetchMovieListAPI() async{
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMovieList().then((value){
      if (kDebugMode) {
        print('Value: $value');
      }
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, s){
      if (kDebugMode) {
        print('Error: $error');
      }
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

}