
import 'dart:convert';
import 'dart:io';
import 'package:flutter_provider_mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart';
import '../app_exceptions.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {

  @override
  Future getGetApiResponse(String url) async{

    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 15));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{

    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: data
      ).timeout(Duration(seconds: 15));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet");
    }
    return responseJson;
  }


  // Todo : We can Handle Response Single For Both GET and POST

  dynamic returnResponse(http.Response response) {
     switch(response.statusCode) {
       case 200:
         dynamic responseJson = jsonDecode(response.body);
         return responseJson;

       case 400:
         throw BadRequestException(response.body.toString());

       case 404:
         throw UnAuthorisedException(response.body.toString());

       case 500:
         throw InternalServerException(response.body.toString());

       default:
         throw FetchDataException("Error accord while communicating with server" +
             "with status code : " + response.statusCode.toString());
     }
  }

}

