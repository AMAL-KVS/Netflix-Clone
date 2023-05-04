import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/core/failures/main_failures.dart';
import 'package:netflix/Domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/Domain/hot_and_new/model/discover_repo/discover_repo.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HotAndNewService _homeService;
  HomePageBloc(this._homeService) : super(HomePageState.initial()) {
/* 
home screen Geting data
*/

    on<GetHomeScreenData>((event, emit) async {
      //sent loading ui
      emit(state.copyWith(isLoading: true, hasError: false));

      //get data
      final _movieresult = await _homeService.getHotAndNewMovieData();
      final _tvresult = await _homeService.getHotAndNewTvData();

//transforme data
      final _state1 = _movieresult.fold((MainFailure failure) {
        return HomePageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trandingMovieList: [],
            tenseDramsMovieList: [],
            southIndianMovieList: [],
            treandingTvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        final tranding = resp.results;
        final dramas = resp.results;
        final southIndian = resp.results;
        pastYear.shuffle();
        tranding.shuffle();
        southIndian.shuffle();

        dramas.shuffle();

        return HomePageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trandingMovieList: tranding,
            tenseDramsMovieList: dramas,
            southIndianMovieList: southIndian,
            treandingTvList: state.treandingTvList,
            isLoading: false,
            hasError: false);
      });
      emit(_state1);

      final _state2 = _tvresult.fold((MainFailure failure) {
        return HomePageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trandingMovieList: [],
            tenseDramsMovieList: [],
            southIndianMovieList: [],
            treandingTvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final top10List = resp.results;
        return HomePageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trandingMovieList: top10List,
            tenseDramsMovieList: state.tenseDramsMovieList,
            southIndianMovieList: state.southIndianMovieList,
            treandingTvList: top10List,
            isLoading: false,
            hasError: true);
      });
      emit(_state2);
    });
  }
}
