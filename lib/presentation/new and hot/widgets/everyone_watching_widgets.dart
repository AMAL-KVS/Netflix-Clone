import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constands.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widgets.dart';

class EveryOneWatchingWidgets extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryOneWatchingWidgets({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        khigth,
        Text(
          movieName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: const TextStyle(color: kgreycolor),
        ),
        khight50,
        VideoWidgets(
          url: posterPath,
        ),
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
