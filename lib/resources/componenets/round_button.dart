import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/resources/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: loading ? CircularProgressIndicator(color: AppColors.whiteColor,) : Text(
            title,
            style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
          )) ,
        ),
      ),
    );
  }
}
