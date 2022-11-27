import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constands.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widgets.dart';

class EveryOneWatchingWidgets extends StatelessWidget {
  const EveryOneWatchingWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        khigth,
        const Text(
          'Friends',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text(
          'This hit sitcom follows the merry misadvantages of six 20-something pals as they negative the pitfalls of work,life and  love in 1999s Manhattan.',
          style: TextStyle(color: kgreycolor),
        ),
        khight50,
        const VideoWidgets(),
        khigth,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidgets(
              icon: Icons.share,
              title: "Share",
              iconsize: 25,
              textsize: 16,
            ),
            kwidth,
            CustomButtonWidgets(
              icon: Icons.add,
              title: "My List",
              iconsize: 25,
              textsize: 16,
            ),
            kwidth,
            CustomButtonWidgets(
              icon: Icons.play_arrow,
              title: "Play",
              iconsize: 25,
              textsize: 16,
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}
