import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/core/failures/main_failures.dart';
import 'package:netflix/Domain/downloads/Model/downloads.dart';
import 'package:netflix/Domain/downloads/i_download_repo.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@Injectable()
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadRepo _downloadRepo;
  DownloadsBloc(this._downloadRepo) : super(DownloadsState.inital()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrSuccessOption: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadRepo.getDownloadsImages();
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              downloadsFailureOrSuccessOption: Some(
                left(failure),
              )),
          (success) => state.copyWith(
              isLoading: false,
              downloadsFailureOrSuccessOption: some(right(success))),
        ),
      );
    });
  }
}
