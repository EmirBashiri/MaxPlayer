// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/View/HomeScreen/home.dart';

class SplashFunction {
  static Future<void> splashStart(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  }
}
