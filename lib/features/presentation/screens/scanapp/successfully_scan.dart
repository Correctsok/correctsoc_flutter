import 'package:audioplayers/audioplayers.dart';
import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/core/utils/assets_manager.dart';
import 'package:correctsoc/features/presentation/screens/scanapp/screening_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/sub_title.dart';
import '../../tools/backgroundimage1.dart';

class SuccessfullyScan extends StatefulWidget {
  const SuccessfullyScan({super.key});

  @override
  State<SuccessfullyScan> createState() => _SuccessfullyScanState();
}

class _SuccessfullyScanState extends State<SuccessfullyScan> {
  double myLeft = 0.0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 2), () {
  //     // Navigator.of(context).pushReplacementNamed(Routes.onbording);
  //     // navigateAndFinish(context, const MyPageView());
  //   });
  // }
  void _playSuccessSound() {
    Locale currentLocale = Localizations.localeOf(context);
    String languageCode = currentLocale.languageCode;
    String soundFile;

    switch (languageCode) {
      case 'ar':
        soundFile = 'sounds/success_sound.mp3';
        break;
      case 'en':
      default:
        soundFile = 'sounds/scansuccessfully.mp3';
        break;
    }

    _audioPlayer.play(AssetSource(soundFile));
  }

  void _playSuccessSound2() {
    Locale currentLocale = Localizations.localeOf(context);
    String languageCode = currentLocale.languageCode;
    String soundFile;

    switch (languageCode) {
      case 'ar':
        soundFile = 'sounds/apk_msg_ar.mp3';
        break;
      case 'en':
      default:
        soundFile = 'sounds/apk_msg_en.mp3';
        break;
    }

    _audioPlayer.play(AssetSource(soundFile));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              //  right: myLeft,
              top: 100.0,
              left: 0.0,
              right: myLeft,
              child: const Image(
                image: AssetImage(ropoo),
                width: 150,
              )),
          Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image(
                    image: const AssetImage(scan),
                    width: 300.w,
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  SubTitle(
                      text: 'Scan successfully Done'.tr(context),
                      size: 25,
                      color: textTitleColor,
                      weight: FontWeight.w500)
                ],
              )),
          Positioned(
            top: 600,
            left: 60,
            child: InkWell(
              onTap: () {
                myLeft = 275.0;
                setState(() {});
                Future.delayed(const Duration(seconds: 3), () {
                  navigateAndFinish(context, const ScreeningApps());
                  _playSuccessSound2();
                });
              },
              child: Container(
                width: 279.w,
                height: 53.h,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: SubTitle(
                      text: 'NEXT'.tr(context),
                      size: 20,
                      color: subTitlecolore,
                      weight: FontWeight.w800),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
