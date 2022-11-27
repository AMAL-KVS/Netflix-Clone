import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constands.dart';

class MainCardHome extends StatelessWidget {
  const MainCardHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          image: NetworkImage(
              "https://www.themoviedb.org/t/p/w220_and_h330_face/sWoYDNPNZs5MtzPbirXV73tIHrA.jpg"),
        ),
      ),
    );
  }
}
