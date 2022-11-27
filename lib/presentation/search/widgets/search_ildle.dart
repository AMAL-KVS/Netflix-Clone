import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

import 'package:netflix/core/constands.dart';
import 'package:netflix/presentation/search/widgets/titles.dart';

const imageurl =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/tSxbUnrnWlR5dQvUgqMI7sACmFD.jpg';

class SearchildleWidget extends StatelessWidget {
  const SearchildleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Top S earches',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            khigth,
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => const TopItemTileWidget()),
                  separatorBuilder: ((context, index) => khigth20),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class TopItemTileWidget extends StatelessWidget {
  const TopItemTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 65,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageurl),
            ),
          ),
        ),
        const Expanded(
          child: SearchTitle(title: 'Top Serches'),
        ),
        const CircleAvatar(
            backgroundColor: kwhiteColor,
            radius: 25,
            child: CircleAvatar(
              backgroundColor: kblackcolor,
              radius: 23,
              child: Icon(
                CupertinoIcons.play_fill,
                color: kwhiteColor,
              ),
            ))
      ],
    );
  }
}
