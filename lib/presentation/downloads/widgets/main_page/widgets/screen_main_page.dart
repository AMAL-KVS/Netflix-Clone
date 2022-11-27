import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/Fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/presentation/downloads/widgets/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/new%20and%20hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final _pages = [
    const HomeScreen(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownload(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifire,
            builder: ((context, int index, _) {
              return _pages[index];
            })),
      ),
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
}
