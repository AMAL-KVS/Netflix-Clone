import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/core/di/injatable.config.dart';

final getIt = GetIt.instance;
@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
}
