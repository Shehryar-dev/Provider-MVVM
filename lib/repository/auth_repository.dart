import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/res/api_urls.dart';
import 'package:mvvm/utils/utils.dart';

class AuthRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.postApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw Utils.toastMessage(e.toString());
    }
  }

  Future<dynamic> registerApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.postApiResponse(AppUrl.registerEndPoint, data);
      return response;
    }catch(e){
      throw Utils.toastMessage(e.toString());
    }
  }

}