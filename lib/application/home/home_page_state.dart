part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trandingMovieList,
    required List<HotAndNewData> tenseDramsMovieList,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> treandingTvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;
  factory HomePageState.initial() => const HomePageState(
      stateId: '0',
      pastYearMovieList: [],
      trandingMovieList: [],
      tenseDramsMovieList: [],
      southIndianMovieList: [],
      treandingTvList: [],
      isLoading: false,
      hasError: false);
}
