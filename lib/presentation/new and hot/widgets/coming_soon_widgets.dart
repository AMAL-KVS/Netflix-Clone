import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constands.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widgets.dart';

class ComingSoonWidgets extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidgets({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 22, color: kgreycolor),
              ),
              Text(
                day,
                style: const TextStyle(
                    color: kgreycolor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidgets(
                url: posterPath,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -5),
                    ),
                  ),
                  const CustomButtonWidgets(
                    icon: Icons.warning,
                    title: "Remind Me",
                    iconsize: 20,
                    textsize: 12,
                  ),
                  khigth,
                  const CustomButtonWidgets(
                    icon: Icons.info,
                    title: " Info",
                    iconsize: 20,
                    textsize: 12,
                  ),
                  kwidth
                ],
              ),
              khigth,
              Text('Coming On $day $month'),
              khigth,
              Text(
                movieName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(description)
            ],
          ),
        ),
      ],
    );
  }
}
