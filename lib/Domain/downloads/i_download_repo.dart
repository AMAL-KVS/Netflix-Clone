import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/core/failures/main_failures.dart';
import 'package:netflix/Domain/downloads/Model/downloads.dart';

abstract class IDownloadRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
