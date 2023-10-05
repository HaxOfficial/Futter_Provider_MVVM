
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm/view/login_view.dart';
import 'package:flutter_provider_mvvm/view/my_home_page.dart';
import 'package:flutter_provider_mvvm/view/signup_view.dart';
import 'package:flutter_provider_mvvm/view/splash_view.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splashView :
        return MaterialPageRoute(builder: (BuildContext context) => SplashView());

      case RoutesName.home :
        return MaterialPageRoute(builder: (BuildContext context) => MyHomePage());

      case RoutesName.login :
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());

      case RoutesName.signUp :
        return MaterialPageRoute(builder: (BuildContext context) => SignUpView());


        // Todo : We can Add many routes as we can

      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No Route Define"),
            ),
          );
        });

    }
  }
}