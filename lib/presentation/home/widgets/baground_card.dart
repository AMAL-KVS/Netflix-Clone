import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constands.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';

class BagroundCard extends StatelessWidget {
  const BagroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 700,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(kMainImage),
          )),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidgets(icon: Icons.add, title: 'My List'),
                _playButton(),
                const CustomButtonWidgets(
                    icon: Icons.info_outline, title: 'Info'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kwhiteColor)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kblackcolor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: kblackcolor),
          ),
        ));
  }
}
