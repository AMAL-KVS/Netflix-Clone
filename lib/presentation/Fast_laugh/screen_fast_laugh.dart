import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/presentation/Fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(body: SafeArea(
      child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while getting data '),
            );
          } else if (state.videosList.isEmpty) {
            return const Center(
              child: Text('List is empty'),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(state.videosList.length, (index) {
                return VideoListItemInheritedWidget(
                    widget:
                        VideoListItem(index: index, key: Key(index.toString())),
                    movieData: state.videosList[index]);
              }),
            );
          }
        },
      ),
    ));
  }
}
