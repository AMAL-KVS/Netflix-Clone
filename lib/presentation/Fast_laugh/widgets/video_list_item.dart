import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 30,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.volume_off))),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/w220_and_h330_face/hYqOjJ7Gh1fbqXrxlIao1g8ZehF.jpg"),
                      ),
                    ),
                    VideoActionWidgets(
                        icon: Icons.emoji_emotions, title: 'Lol'),
                    VideoActionWidgets(icon: Icons.add, title: 'Share'),
                    VideoActionWidgets(icon: Icons.play_arrow, title: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidgets extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidgets({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: const TextStyle(color: kwhiteColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
