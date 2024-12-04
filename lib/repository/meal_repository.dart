
import 'package:flutter/foundation.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/model/meal_model.dart';
import 'package:mvvm/res/api_urls.dart';
import 'package:mvvm/utils/utils.dart';

class MealRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  Future<MealModel> fetchMealList() async {
    try {
      dynamic response = await _apiServices.getApiResponse(
          AppUrl.mealEndPoint
      );
      return response = MealModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Utils.toastMessage(e.toString());
    }
  }
}