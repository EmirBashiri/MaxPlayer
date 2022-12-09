import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/Model/Tools/Color/color.dart';
import 'package:flutter_application_videoplayer/Model/Tools/Constant/const.dart';
import 'package:flutter_application_videoplayer/ViewModel/Splash/splash_vm.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    SplashFunction.splashStart(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColor.secondry,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              logoImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          LoadingAnimationWidget.fourRotatingDots(
              color: LightThemeColor.primary, size: 100)
        ],
      ),
    );
  }
}
