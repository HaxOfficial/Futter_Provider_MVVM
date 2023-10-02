import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("MVVM"),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Center(child: Text("home Screen"))
          ],
        ),
      ),
    );
  }
}
