import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/downloads/Model/downloads.dart';

import '../core/failures/main_failures.dart';

abstract class IDownloadsRep {
  Future<Either<MainFailure, List<Downloads>>> getdownloadsImage();
}
