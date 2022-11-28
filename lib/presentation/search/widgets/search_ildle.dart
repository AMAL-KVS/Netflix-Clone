import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';

import 'package:netflix/core/constands.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentation/search/widgets/titles.dart';

class SearchildleWidget extends StatelessWidget {
  const SearchildleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Top S earches',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            khigth,
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.isError) {
                    return const Center(
                      child: Text('Error while getting data'),
                    );
                  } else if (state.idleList.isEmpty) {
                    return const Center(
                      child: Text('List is empty'),
                    );
                  }
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        final movie = state.idleList[index];
                        return TopItemTileWidget(
                          title: movie.title ?? 'No providers',
                          imageUrl: '$imageAppendurl${movie.posterPath}',
                        );
                      }),
                      separatorBuilder: ((context, index) => khigth20),
                      itemCount: state.idleList.length);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopItemTileWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopItemTileWidget(
      {Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kwidth,
        Expanded(
          child: SearchTitle(title: title),
        ),
        const CircleAvatar(
            backgroundColor: kwhiteColor,
            radius: 25,
            child: CircleAvatar(
              backgroundColor: kblackcolor,
              radius: 23,
              child: Icon(
                CupertinoIcons.play_fill,
                color: kwhiteColor,
              ),
            ))
      ],
    );
  }
}
