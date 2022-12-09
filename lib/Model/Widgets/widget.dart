

import 'package:flutter/material.dart';
import 'package:flutter_application_videoplayer/Model/Tools/Color/color.dart';
import 'package:flutter_application_videoplayer/Model/Tools/Fonts/font.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';


Widget choisePlayTypeButton(
    {required GestureTapCallback callback, required String buttonName}) {
  return SizedBox(
    width: 170,
    height: 60,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(LightThemeColor.secondry)),
          onPressed: callback,
          child: Text(
            buttonName,
            style: CustomTextStyle.bodyNormal.copyWith(
              color: LightThemeColor.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.clip,
            ),
          )),
    ),
  );
}

// class VideoProgress extends StatefulWidget {
//   final VideoPlayerController playerController;

//   const VideoProgress({super.key, required this.playerController});
//   @override
//   State<VideoProgress> createState() => _VideoProgressState();
// }

// class _VideoProgressState extends State<VideoProgress> {
//   Timer? timer;
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   late VideoPlayerController pc = widget.playerController;
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: pc.position.asStream(),
//         builder: (context, snap) {
//           PlayFunctions.videoTimer(
//             callback: () {
//               if (mounted) {
//                 setState(() {});
//               } else {
//                 return;
//               }
//             },
//           );
//           return ProgressBar(
//               thumbRadius: 7,
//               barHeight: 7,
//               barCapShape: BarCapShape.square,
//               thumbColor: LightThemeColor.secondry,
//               progressBarColor: LightThemeColor.secondry,
//               timeLabelTextStyle: CustomTextStyle.bodyNormal
//                   .copyWith(color: LightThemeColor.black, fontSize: 17),
//               buffered: Duration(
//                 seconds: pc.value.position.inSeconds + 15,
//               ),
//               onSeek: (value) {
//                 pc.seekTo(value);
//               },
//               progress: pc.value.position,
//               total: pc.value.duration);
//         });
//   }
// }

class AppException extends StatelessWidget {
  const AppException({
    super.key,
    this.callback,
    this.title = "undefined error",
  });
  final GestureTapCallback? callback;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: CustomTextStyle.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: callback,
                child: Text(
                  'try again',
                  style: CustomTextStyle.bodyNormal,
                ))
          ],
        ),
      ),
    );
  }
}

Widget seekVideo(
    {required GestureTapCallback callback, required Widget buttonName}) {
  return SizedBox(
    width: 50,
    height: 30,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(LightThemeColor.secondry)),
          onPressed: callback,
          child: Center(child: buttonName)),
    ),
  );
}

Widget loadingAnimation() {
  return Scaffold(
    body: Center(
      child: LoadingAnimationWidget.fourRotatingDots(
          color: LightThemeColor.secondry, size: 100),
    ),
  );
}
