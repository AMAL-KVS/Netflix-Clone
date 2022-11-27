import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constands.dart';
import 'package:netflix/presentation/home/widgets/baground_card.dart';
import 'package:netflix/presentation/home/widgets/number_tailed_card.dart';
import 'package:netflix/presentation/widgets/main_card_title.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ListView(
                children: const [
                  BagroundCard(),
                  MainCardTile(title: 'Release in the past year'),
                  khigth,
                  MainCardTile(title: 'Trending Now'),
                  khigth,
                  NumberTileCard(),
                  khigth,
                  MainCardTile(title: 'Tense Dramas'),
                  khigth,
                  MainCardTile(title: 'South Indian Cinima'),
                ],
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
