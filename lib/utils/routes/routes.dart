
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm/view/login_screen.dart';
import 'package:flutter_provider_mvvm/view/my_home_page.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.home :
        return MaterialPageRoute(builder: (BuildContext context) => MyHomePage());

      case RoutesName.login :
        return MaterialPageRoute(builder: (BuildContext context) => LoginScreen());

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