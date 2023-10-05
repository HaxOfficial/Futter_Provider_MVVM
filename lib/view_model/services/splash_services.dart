

import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm/utils/utils.dart';
import 'package:flutter_provider_mvvm/view_model/user_view_model.dart';

import '../../model/user_model.dart';

class SplashServices {

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async{
    getUserData().then((value){
      if(value.token == "null" || value.token == "") {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace){
      Utils.flushBarErrorMessages(error.toString(), "Error", context);
    });
  }
  
}