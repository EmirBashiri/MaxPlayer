import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/View/HomeScreen/bloc/home_bloc.dart';
import 'package:flutter_application_videoplayer/View/PlayScreenFromYT/bloc/play_from_yt_bloc.dart';
import 'package:flutter_application_videoplayer/View/SplashScreen/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = HomeBloc();
            bloc.add(HomeStart());
            return bloc;
          },
        ),
        BlocProvider(
          create: (context) {
            final bloc = PlayFromYtBloc();
            return bloc;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Video Player',
        theme: ThemeData(),
        home: const SplashScreen(),
      ),
    );
  }
}
