import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors/colors.dart';

class SearchTitle extends StatelessWidget {
  final String title;
  const SearchTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: kwhiteColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
