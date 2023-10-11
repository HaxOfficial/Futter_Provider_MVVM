import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


/// Login email : eve.holt@reqres.in

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [ InkWell(
            onTap: () {
              userPreference.remove().then((value){
                Navigator.pushReplacementNamed(context, RoutesName.login);
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Center(
                child: Row(
                  children: const [
                    Text("Logout"),
                    SizedBox(width: 5,),
                    Icon(Icons.logout, color: Colors.white,),
                  ],
                ),
              ),
            )),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
            child: Text("")),
      ),
    );
  }
}
