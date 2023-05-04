import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_page_bloc.dart';
import 'package:netflix/core/constands.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentation/home/widgets/baground_card.dart';
import 'package:netflix/presentation/home/widgets/number_tailed_card.dart';
import 'package:netflix/presentation/widgets/main_card_title.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomePageBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollnotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: ((notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollnotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollnotifier.value = true;
            }
            return true;
          }),
          child: Stack(
            children: [
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  }
                  final _releasedPastYear = state.pastYearMovieList.map(
                    (m) {
                      return '$imageAppendurl${m.posterPath}';
                    },
                  ).toList();

                  //trending
                  final _trending = state.treandingTvList.map(
                    (m) {
                      return '$imageAppendurl${m.posterPath}';
                    },
                  ).toList();

                  //trends drama
                  final _trendsDrama = state.tenseDramsMovieList.map(
                    (m) {
                      return '$imageAppendurl${m.posterPath}';
                    },
                  ).toList();

                  //Sounth inndian movies
                  final _southIndianMovies = state.southIndianMovieList.map(
                    (m) {
                      return '$imageAppendurl${m.posterPath}';
                    },
                  ).toList();
                  _southIndianMovies.shuffle();

                  //top10 tv shows
                  final _top10TvShows = state.treandingTvList.map(
                    (t) {
                      return '$imageAppendurl${t.posterPath}';
                    },
                  ).toList();

                  _top10TvShows.shuffle();

                  print(_top10TvShows.length);
//List view
                  return ListView(
                    children: [
                      const BagroundCard(),
                      if (_releasedPastYear.length >= 10)
                        MainCardTile(
                          title: 'Released in the past year',
                          posterList: _releasedPastYear.sublist(0, 10),
                        ),
                      khigth,
                      if (_trending.length >= 10)
                        MainCardTile(
                          title: 'Trending Now',
                          posterList: _trending.sublist(0, 10),
                        ),
                      khigth,
                      NumberTileCard(
                        postersList: _top10TvShows.sublist(0, 10),
                      ),
                      if (_trendsDrama.length >= 10)
                        MainCardTile(
                          title: 'Trends Drama',
                          posterList: _trendsDrama.sublist(0, 10),
                        ),
                      khigth,
                      if (_southIndianMovies.length >= 10)
                        MainCardTile(
                          title: 'South Indian Cinema',
                          posterList: _southIndianMovies.sublist(0, 10),
                        ),
                      khigth,
                    ],
                  );
                },
              ),
              scrollnotifier.value == true
                  ? AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 100,
                      color: Colors.black.withOpacity(0.4),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
                                width: 70,
                                height: 70,
                              ),
                              const Spacer(),
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'TV Shows',
                                style: kHomeTitleText,
                              ),
                              Text(
                                'Movies',
                                style: kHomeTitleText,
                              ),
                              Text(
                                'Categories',
                                style: kHomeTitleText,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : khigth
            ],
          ),
        );
      },
    ));
  }
}
