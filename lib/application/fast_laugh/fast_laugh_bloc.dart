import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/downloads/Model/downloads.dart';
import 'package:netflix/Domain/downloads/i_download_repo.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final videoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
];
ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRep _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //senting loading to ui
      emit(const FastLaughState(
        videosList: [],
        isLoading: true,
        isError: false,
        LikedVideosIds: [],
      ));
//get trending movies
      final _result = await _downloadService.getdownloadsImage();
      final _state = _result.fold((l) {
        return FastLaughState(
          videosList: [],
          isLoading: false,
          isError: true,
          LikedVideosIds: state.LikedVideosIds,
        );
      },
          (resp) => FastLaughState(
                videosList: resp,
                isLoading: false,
                isError: false,
                LikedVideosIds: state.LikedVideosIds,
              ));
//sent to ui
      emit(_state);
    });

    on<LikeVideo>((event, emit) async {
      likedVideosIdsNotifier.value.add(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
    on<UnLikeVideo>((event, emit) async {
      likedVideosIdsNotifier.value.remove(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
  }
}
