import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/main_card.dart';

import 'main_titile.dart';

class MainCardTile extends StatelessWidget {
  const MainCardTile({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => const MainCardHome()),
          ),
        )
      ],
    );
  }
}
