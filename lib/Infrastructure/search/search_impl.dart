import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/core/api_end_points.dart';
import 'package:netflix/Domain/core/failures/main_failures.dart';
import 'package:netflix/Domain/search/model/search_repo/search_repo.dart';
import 'package:netflix/Domain/search/search_Service.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchRepo>> searchMovies(
      {required String movieQuery}) async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'query': movieQuery,
      });
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchRepo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
