import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/core/failures/main_failures.dart';
import 'package:netflix/Domain/hot_and_new/model/discover_repo/discover_repo.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData();
}
