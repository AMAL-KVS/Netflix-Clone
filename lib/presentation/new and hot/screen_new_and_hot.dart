import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
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
        body: TabBarView(children: [
          _buidComingSoon(),
          _buildveryonesWatching(),
        ]),
      ),
    );
  }

  Widget _buidComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: ((BuildContext context, index) => const ComingSoonWidgets()),
    );
  }

  Widget _buildveryonesWatching() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) =>
            const EveryOneWatchingWidgets());
  }
}
