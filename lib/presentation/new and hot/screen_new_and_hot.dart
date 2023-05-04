import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:netflix/Domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/application/Hot/hot_and_new_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new%20and%20hot/widgets/coming_soon_widgets.dart';
import 'package:netflix/presentation/new%20and%20hot/widgets/everyone_watching_widgets.dart';

import 'package:netflix/presentation/widgets/video_widgets.dart';

import '../../core/constands.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: Text(
              'New & Hot',
              style: GoogleFonts.montserrat(
                  fontSize: 30, fontWeight: FontWeight.w900),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kwidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              khigth,
            ],
            bottom: TabBar(
                unselectedLabelColor: kwhiteColor,
                labelColor: kblackcolor,
                isScrollable: true,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(color: kwhiteColor, borderRadius: kRadius30),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching ",
                  )
                ]),
          ),
        ),
        body: const TabBarView(children: [
          ComingSoonList(),
          EveryOneWatching(),
        ]),
      ),
    );
  }

  // Widget _buidComingSoon() {
  //   return ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: ((BuildContext context, index) => const ComingSoonWidgets()),
  //   );
  // }

  // Widget _buildveryonesWatching() {
  //   return ListView.builder(
  //       itemCount: 10,
  //       itemBuilder: (BuildContext context, index) =>
  //           const EveryOneWatchingWidgets(),
  //           );
  // }

}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
    );

    return RefreshIndicator(
      color: bagroundColor,
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
                child: Text('Error while loading coming soon list'));
          } else if (state.comingSoonList.isEmpty) {
            return const Center(child: Text('coming soon list is empty'));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 15),
                itemCount: state.comingSoonList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  String month = '';
                  String date = '';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    month = formatedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }

                  return ComingSoonWidgets(
                      id: movie.id.toString(),
                      month: month,
                      day: date,
                      posterPath: '$imageAppendurl${movie.posterPath}',
                      movieName: movie.originalTitle ?? 'No Title',
                      description: movie.overview ?? 'No description');
                });
          }
        },
      ),
    );
  }
}

class EveryOneWatching extends StatelessWidget {
  const EveryOneWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatchig());
    });
    return RefreshIndicator(
      color: bagroundColor,
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryoneIsWatchig());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
                child: Text('Error while loading coming soon list'));
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(child: Text('coming soon list is empty'));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: state.everyOneIsWatchingList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.everyOneIsWatchingList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }

                  final tv = state.everyOneIsWatchingList[index];

                  return EveryOneWatchingWidgets(
                      posterPath: '$imageAppendurl${tv.posterPath}',
                      movieName: tv.originalName ?? 'No Name Provided',
                      description: tv.overview ?? 'No Description');
                });
          }
        },
      ),
    );
  }
}
