import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/search/model/search_repo/search_repo.dart';

import '../core/failures/main_failures.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchRepo>> searchMovies({
    required String movieQuery,
  });
}
