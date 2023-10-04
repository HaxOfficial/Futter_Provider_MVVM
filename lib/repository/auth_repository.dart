
import 'package:flutter_provider_mvvm/data/network/BaseApiServices.dart';
import 'package:flutter_provider_mvvm/data/network/NetworkApiServices.dart';
import 'package:flutter_provider_mvvm/resources/app_urls.dart';

class AuthRepository {

  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async{
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async{
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

}