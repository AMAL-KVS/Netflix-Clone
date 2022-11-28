import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Domain/core/debounse/debouns.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constands.dart';
import 'package:netflix/presentation/search/widgets/search_ildle.dart';
import 'package:netflix/presentation/search/widgets/search_results.dart';

class ScreenSearch extends StatelessWidget {
  final _debounser = Debouncer(milliseconds: 1 * 1000);
  ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(Initialize());
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  _debounser.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchMovie(movieQuery: value));
                  });
                },
              ),
              khigth,
              Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.searchResultList.isEmpty) {
                    return const SearchildleWidget();
                  } else {
                    return const SearchResultWidgets();
                  }
                },
              )),
              // const Expanded(child: ),
            ],
          ),
        ),
      ),
    );
  }
}
