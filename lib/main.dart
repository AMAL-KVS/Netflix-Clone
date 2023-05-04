import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Domain/core/di/injatable.dart';
import 'package:netflix/application/Hot/hot_and_new_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/downloads/widgets/main_page/widgets/screen_main_page.dart';
import 'dart:io';
import 'application/fast_laugh/fast_laugh_bloc.dart';
import 'application/home/home_page_bloc.dart';
import 'application/search/search_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  runApp(const MyApp());
  //HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<FastLaughBloc>()),
        BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
        BlocProvider(create: (ctx) => getIt<HomePageBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenMainPage(),
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            primarySwatch: Colors.blue,
            backgroundColor: Colors.black,
            scaffoldBackgroundColor: bagroundColor,
            textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
