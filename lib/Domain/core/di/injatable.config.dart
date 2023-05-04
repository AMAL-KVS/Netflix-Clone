// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/downloads_bloc.dart' as _i9;
import '../../../application/fast_laugh/fast_laugh_bloc.dart' as _i10;
import '../../../application/home/home_page_bloc.dart' as _i11;
import '../../../application/Hot/hot_and_new_bloc.dart' as _i12;
import '../../../application/search/search_bloc.dart' as _i13;
import '../../../Infrastructure/downloads/download_repository.dart' as _i6;
import '../../../Infrastructure/hot_and_new/hot_new_impl.dart' as _i4;
import '../../../Infrastructure/search/search_impl.dart' as _i8;
import '../../downloads/i_download_repo.dart' as _i5;
import '../../hot_and_new/hot_and_new_service.dart' as _i3;
import '../../search/search_Service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.HotAndNewService>(() => _i4.HotAndNewImplimentation());
  gh.lazySingleton<_i5.IDownloadsRep>(() => _i6.DownloadsRepositery());
  gh.lazySingleton<_i7.SearchService>(() => _i8.SearchImpl());
  gh.factory<_i9.DownloadsBloc>(
      () => _i9.DownloadsBloc(get<_i5.IDownloadsRep>()));
  gh.factory<_i10.FastLaughBloc>(
      () => _i10.FastLaughBloc(get<_i5.IDownloadsRep>()));
  gh.factory<_i11.HomePageBloc>(
      () => _i11.HomePageBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i12.HotAndNewBloc>(
      () => _i12.HotAndNewBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i13.SearchBloc>(() => _i13.SearchBloc(
        get<_i7.SearchService>(),
        get<_i5.IDownloadsRep>(),
      ));
  return get;
}
