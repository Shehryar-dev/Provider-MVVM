import 'package:flutter/foundation.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/meal_model.dart';
import 'package:mvvm/repository/meal_repository.dart';

class MealViewViewModel with ChangeNotifier{
  final _myRepo = MealRepository();
  ApiResponse<MealModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MealModel> response){
    moviesList = response;
    notifyListeners();
  }


  Future<dynamic> fetchMealListAPI() async{
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMealList().then((value){
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