import 'package:flutter/cupertino.dart';

import 'package:netflix/core/constands.dart';
import 'package:netflix/presentation/search/widgets/titles.dart';

const imageurl =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/tegBpjM5ODoYoM1NjaiHVLEA0QM.jpg";

class SearchResultWidgets extends StatelessWidget {
  const SearchResultWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(title: 'Movie & TV'),
        khigth,
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.4,
          children: List.generate(
            20,
            (index) {
              return const MainCard();
            },
          ),
        )),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: NetworkImage(imageurl), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
