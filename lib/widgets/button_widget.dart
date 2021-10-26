import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String? title;
  Widget? icon;
  double? height;
  Function? onPressed;
  Color? textColor, bgColor;

  ButtonWidget(
      {this.title,
      this.height,
      this.onPressed,
      this.icon,
      this.textColor,
      this.bgColor});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all(Colors.black),
          foregroundColor: MaterialStateProperty.all(Colors.white)),
      onPressed: onPressed as void Function()?,
      child: Container(
        height: height,
        child: Center(
          child: Text(
            title!,
            style: TextStyle(fontSize: 25, fontFamily: 'Poppins-Regular'),
          ),
        ),
      ),
    );
  }
}
