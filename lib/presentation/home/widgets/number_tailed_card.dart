import 'package:flutter/material.dart';

import '../../widgets/main_titile.dart';
import 'number_card.dart';

class NumberTileCard extends StatelessWidget {
  const NumberTileCard({Key? key, required this.postersList}) : super(key: key);
  final List<String> postersList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 TV In India Today'),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                postersList.length,
                (index) => NumberCard(
                      imageUrl: postersList[index],
                      index: index,
                    )),
          ),
        )
      ],
    );
  }
}
