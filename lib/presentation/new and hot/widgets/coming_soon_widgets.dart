import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constands.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widgets.dart';

class ComingSoonWidgets extends StatelessWidget {
  const ComingSoonWidgets({
    Key? key,
  }) : super(key: key);

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
            children: const [
              Text(
                'FEB',
                style: TextStyle(fontSize: 22, color: kgreycolor),
              ),
              Text(
                '11',
                style: TextStyle(
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
              const VideoWidgets(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'TALL GIRL 2',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -5),
                  ),
                  CustomButtonWidgets(
                    icon: Icons.warning,
                    title: "Remind Me",
                    iconsize: 20,
                    textsize: 12,
                  ),
                  khigth,
                  CustomButtonWidgets(
                    icon: Icons.info,
                    title: " Info",
                    iconsize: 20,
                    textsize: 12,
                  ),
                  kwidth
                ],
              ),
              khigth,
              const Text('Coming On Fryday'),
              khigth,
              const Text(
                'Tall Girl 2',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                  'Landing the lead inn the school  musical is dream come true for jodi, untill the presure sents her  confidence-and her releationship-into a tailspain')
            ],
          ),
        ),
      ],
    );
  }
}
