import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/downloads/Model/downloads.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/strings.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterpath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = videoUrls[index % videoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool) {}),

        // Container(
        //   color: Colors.accents[index % Colors.accents.length],
        // ),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterpath == null
                            ? null
                            : NetworkImage('$imageAppendurl$posterpath'),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdsNotifier,
                      builder: (BuildContext c, Set<int> newLikedListIds,
                          Widget? _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onDoubleTap: () {
                              likedVideosIdsNotifier.value.remove(_index);
                              likedVideosIdsNotifier.notifyListeners();
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnLikeVideo(id: _index));
                            },
                            child: const VideoActionWidgets(
                                icon: Icons.favorite, title: 'Liked'),
                          );
                        }

                        return GestureDetector(
                          onDoubleTap: () {
                            likedVideosIdsNotifier.value.add(_index);
                            likedVideosIdsNotifier.notifyListeners();
                            // BlocProvider.of<FastLaughBloc>(context)
                            //     .add(LikeVideo(id: _index));
                          },
                          child: const VideoActionWidgets(
                              icon: Icons.emoji_emotions, title: 'Lol'),
                        );
                      },
                    ),
                    GestureDetector(
                        onDoubleTap: () {
                          final movieName =
                              VideoListItemInheritedWidget.of(context)
                                  ?.movieData
                                  .posterPath;
                          if (movieName != null) {
                            Share.share(movieName);
                          }
                        },
                        child: const VideoActionWidgets(
                            icon: Icons.share, title: 'Share')),
                    GestureDetector(
                      onDoubleTap: () {},
                      child: const VideoActionWidgets(
                          icon: Icons.play_arrow, title: 'Play'),
                    )
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

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
