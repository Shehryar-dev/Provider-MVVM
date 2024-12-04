import 'dart:convert';
import 'dart:io';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices{

  @override
  Future getApiResponse(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('Internet Connection loading');
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url,dynamic data) async{
    dynamic responseJson;
    try{
      final response = await http.post(Uri.parse(url),body: data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response responseCode){
    switch(responseCode.statusCode){
      case 200:
        dynamic responseJsonData = jsonDecode(responseCode.body);
        return responseJsonData;
      case 400:
        throw BadRequestException(responseCode.statusCode.toString());

      case 500:
        throw BadRequestException(responseCode.statusCode.toString());

      default:
        throw FetchDataException('Error occurred while communicating with server with status code: ${responseCode.statusCode}');
    }
  }



}