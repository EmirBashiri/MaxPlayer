import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/Model/Tools/Color/color.dart';
import 'package:flutter_application_videoplayer/Model/Tools/Fonts/font.dart';
import 'package:flutter_application_videoplayer/Model/Widgets/widget.dart';
import 'package:flutter_application_videoplayer/View/HomeScreen/bloc/home_bloc.dart';
import 'package:flutter_application_videoplayer/View/PlayScreen/play.dart';
import 'package:flutter_application_videoplayer/ViewModel/Home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

HomeBloc? homeBloc;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is PlaySuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlayScreen(
                  playerController: state.playerController,
                  isYouTube: false,
                ),
              ));
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeDefaultScreen) {
            return Scaffold(
              backgroundColor: LightThemeColor.primary,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: LightThemeColor.appBarColor,
                title: Text(
                  "Max Player",
                  style: CustomTextStyle.bodyNormal,
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome To Max Player',
                    style: CustomTextStyle.titleLarge.copyWith(
                        backgroundColor: LightThemeColor.secondry,
                        color: LightThemeColor.primary),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "please choise your video type ...",
                          style: CustomTextStyle.bodyNormal.copyWith(
                            fontSize: 20,
                            overflow: TextOverflow.clip,
                            fontWeight: FontWeight.w700,
                            color: LightThemeColor.secondry,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              choisePlayTypeButton(
                                  callback: () {
                                    fromLink(context);
                                  },
                                  buttonName: "from Url link"),
                              const SizedBox(
                                height: 10,
                              ),
                              choisePlayTypeButton(
                                  callback: () {
                                    fromGallery(context);
                                  },
                                  buttonName: "from Gallery"),
                              const SizedBox(
                                height: 10,
                              ),
                              choisePlayTypeButton(
                                  callback: () {
                                    fromYouTube(context);
                                  },
                                  buttonName: "from YouTube"),
                            ],
                          ),
                        ),
                      ],
                    )),
                  )
                ],
              ),
            );
          } else if (state is HomeError) {
            return AppException(
              title: state.appException.title,
              callback: () {
                BlocProvider.of<HomeBloc>(context).add(HomeStart());
              },
            );
          } else if (state is HomeLoading) {
            return loadingAnimation();
          }
          return loadingAnimation();
        },
      ),
    );
  }
}
