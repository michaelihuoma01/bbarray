import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final Function? onPressed;
  final Color? textColor, bgColor; 

  ButtonWidget(
      {this.title,
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
              height: 70,
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
