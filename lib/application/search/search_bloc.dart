import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/core/failures/main_failures.dart';
import 'package:netflix/Domain/downloads/Model/downloads.dart';
import 'package:netflix/Domain/downloads/i_download_repo.dart';
import 'package:netflix/Domain/search/model/search_repo/search_repo.dart';
import 'package:netflix/Domain/search/search_Service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRep _downloadsService;
  final SearchService _searchService;
  SearchBloc(
    this._searchService,
    this._downloadsService,
  ) : super(SearchState.initial()) {
/*
idle State
*/
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false));
        return;
      }
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      // get trending
      final _result = await _downloadsService.getdownloadsImage();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      //show to ui
      emit(_state);
    });
/*
search Result State
*/
    on<SearchMovie>((event, emit) async {
      // call searcch movie Api
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchRepo r) {
        return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false);
      });
      //show to ui
      emit(_state);
    });
  }
}
