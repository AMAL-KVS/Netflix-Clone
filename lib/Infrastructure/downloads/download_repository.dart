import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/core/api_end_points.dart';
import 'package:netflix/Domain/core/failures/main_failures.dart';
import 'package:netflix/Domain/downloads/Model/downloads.dart';
import 'package:netflix/Domain/downloads/i_download_repo.dart';

import 'package:dartz/dartz.dart';

@LazySingleton(as: IDownloadsRep)
class DownloadsRepositery implements IDownloadsRep {
  @override
  Future<Either<MainFailure, List<Downloads>>> getdownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
