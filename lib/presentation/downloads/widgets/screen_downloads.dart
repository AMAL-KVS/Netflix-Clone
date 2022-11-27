import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constands.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({Key? key}) : super(key: key);
  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(15),
            itemBuilder: ((context, index) => _widgetList[index]),
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 20,
                )),
            itemCount: _widgetList.length));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class DawnloadsImageWidget extends StatelessWidget {
  const DawnloadsImageWidget({
    Key? key,
    required this.imagelist,
    this.angle = 0,
    required this.margin,
    required this.size,
  }) : super(key: key);

  final String imagelist;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imagelist)),
        ),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Indroducing Downloads For you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        khigth,
        const Text(
          'We will Download a  personlised selection of \nmovies and shows for you , so there is \n always something to watch on your \ndevice',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        khigth,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: size.height * 0.57,
                    width: size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            radius: size.width * 0.4,
                          ),
                        ),
                        DawnloadsImageWidget(
                          imagelist:
                              ' $imageAppendurl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 130, bottom: 50),
                          angle: 20,
                          size: Size(size.width * 0.4, size.width * 0.58),
                        ),
                        DawnloadsImageWidget(
                          imagelist:
                              '$imageAppendurl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 130, bottom: 50),
                          angle: -20,
                          size: Size(size.width * 0.4, size.width * 0.58),
                        ),
                        DawnloadsImageWidget(
                          imagelist:
                              '$imageAppendurl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(bottom: 10),
                          size: Size(size.width * 0.4, size.width * 0.65),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kbuttoncolorBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Setup',
                  style: TextStyle(
                    color: kwhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ),
        khigth,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kwhiteColor,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('See what you can download',
                style: TextStyle(
                  color: kblackcolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ],
    );
  }
}
