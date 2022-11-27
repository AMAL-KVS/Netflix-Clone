import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonWidgets extends StatelessWidget {
  const CustomButtonWidgets(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconsize = 20,
      this.textsize = 18})
      : super(
          key: key,
        );
  final IconData icon;
  final String title;
  final double iconsize;
  final double textsize;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(
        icon,
        color: kwhiteColor,
        size: iconsize,
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: textsize,
        ),
      )
    ]);
  }
}
