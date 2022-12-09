import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/Model/Tools/Color/color.dart';
import 'package:flutter_application_videoplayer/Model/Tools/Fonts/font.dart';
import 'package:flutter_application_videoplayer/View/HomeScreen/bloc/home_bloc.dart';
import 'package:flutter_application_videoplayer/View/PlayScreenFromYT/bloc/play_from_yt_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../View/PlayScreenFromYT/pc_yt.dart';

void fromLink(BuildContext context) {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: LightThemeColor.white,
        title: Center(
          child: Text(
            "Play From Link",
            style: CustomTextStyle.titleLarge,
          ),
        ),
        content: Container(
          width: MediaQuery.of(context).size.width * .65,
          height: MediaQuery.of(context).size.height * .4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: LightThemeColor.secondry, width: 2)),
          margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Form(
                key: key,
                child: TextFormField(
                  controller: controller,
                  validator: (value) {
                    if (value != null) {
                      return null;
                    } else {
                      return "please enter URL link";
                    }
                  },
                  decoration: InputDecoration(
                      label: Text(
                    'video URl ...',
                    style: CustomTextStyle.bodyNormal,
                  )),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(LightThemeColor.secondry)),
                onPressed: () {
                  if (key.currentState!.validate()) {
                    // Navigate to play screen
                    BlocProvider.of<HomeBloc>(context)
                        .add(PlayFromURL(controller.text));
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Play Video",
                  style: CustomTextStyle.bodyNormal,
                )),
          )
        ],
      );
    },
  );
}

void fromGallery(BuildContext context) {
  BlocProvider.of<HomeBloc>(context).add(PlayFromGallery());
}

void fromYouTube(BuildContext context) {
  final TextEditingController controller =
      TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: LightThemeColor.white,
        title: Center(
          child: Text(
            "Play From YouTube",
            style: CustomTextStyle.titleLarge,
          ),
        ),
        content: Container(
          width: MediaQuery.of(context).size.width * .65,
          height: MediaQuery.of(context).size.height * .4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: LightThemeColor.secondry, width: 2)),
          margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Form(
                key: key,
                child: TextFormField(
                  controller: controller,
                  validator: (value) {
                    if (value != null) {
                      return null;
                    } else {
                      return "please enter URL link";
                    }
                  },
                  decoration: InputDecoration(
                      label: Text(
                    'video URl ...',
                    style: CustomTextStyle.bodyNormal,
                  )),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(LightThemeColor.secondry)),
                onPressed: () async{
                  if (key.currentState!.validate()) {
                    // // Navigate to play screen
                    BlocProvider.of<PlayFromYtBloc>(context)
                        .add(PlayFromYouTube(controller.text));
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlayScreenYT(),
                        ));
                  }
                },
                child: Text(
                  "Play Video",
                  style: CustomTextStyle.bodyNormal,
                )),
          )
        ],
      );
    },
  );
}
