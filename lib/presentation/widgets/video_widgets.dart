import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoWidgets extends StatelessWidget {
  final String url;
  const VideoWidgets({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }
            },
            errorBuilder: (_, a, trace) {
              return const Center(
                child: Icon(
                  Icons.wifi,
                  color: kwhiteColor,
                ),
              );
            },
          ),
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
