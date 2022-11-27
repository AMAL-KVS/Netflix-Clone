import 'package:flutter/material.dart';

class VideoWidgets extends StatelessWidget {
  const VideoWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
              "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/criDqw2LTv55YVdLyXAEEaJNIEL.jpg"),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              radius: 25,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.volume_off),
                iconSize: 20,
              )),
        ),
      ],
    );
  }
}
