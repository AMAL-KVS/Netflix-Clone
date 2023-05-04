import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/core/failures/main_failures.dart';
import 'package:netflix/Domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix/Domain/hot_and_new/model/discover_repo/discover_repo.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNEwService;
  HotAndNewBloc(this._hotAndNEwService) : super(HotAndNewState.initial()) {
    //get hot and new movie data
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));

//get data from resourse

      final _result = await _hotAndNEwService.getHotAndNewMovieData();

//data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        return HotAndNewState(
            comingSoonList: resp.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: false);
      });

      emit(newState);
    });

//get hot and new Tv data
    on<LoadDataInEveryoneIsWatchig>((event, emit) async {
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));

//get data from resourse

      final _result = await _hotAndNEwService.getHotAndNewTvData();

//data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyOneIsWatchingList: resp.results,
            isLoading: false,
            hasError: false);
      });

      emit(newState);
    });
  }
}
