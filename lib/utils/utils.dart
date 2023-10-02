import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  // Todo : Toast Messages
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 15,
        toastLength: Toast.LENGTH_LONG);
  }

  // Todo : Flush Bar
  static void flushBarErrorMessages(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          backgroundColor: Colors.red.shade100,
          title: "Login Status",
          titleColor: Colors.black,
          messageColor: Colors.black,
          duration: Duration(seconds: 5),
          // showProgressIndicator: true,
          // progressIndicatorBackgroundColor: Colors.white,
          // progressIndicatorValueColor: Colors.green,
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeOut,
          flushbarPosition: FlushbarPosition.BOTTOM,
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            color: Colors.red,
            size: 30,
          ),
        )..show(context));
  }

  // Todo : SnackBar

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white, fontSize: 15),),
      backgroundColor: Colors.green.shade400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: Duration(seconds: 3),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      behavior: SnackBarBehavior.floating,
    ));
  }


  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

}
