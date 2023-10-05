import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("MVVM"),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Center(
            child: InkWell(
                onTap: () {
                  userPreference.remove().then((value){
                    Navigator.pushReplacementNamed(context, RoutesName.login);
                  });
                },
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 25),
                ))),
      ),
    );
  }
}
