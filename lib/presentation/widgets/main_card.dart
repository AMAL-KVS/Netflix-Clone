import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constands.dart';

class MainCardHome extends StatelessWidget {
  final String imageUrl;
  const MainCardHome({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
