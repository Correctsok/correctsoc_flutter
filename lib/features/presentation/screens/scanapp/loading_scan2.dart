import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/core/utils/assets_manager.dart';
import 'package:correctsoc/features/presentation/screens/scanapp/successfully_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/components/components.dart';

class Loading2Scan extends StatefulWidget {
  const Loading2Scan({super.key});

  @override
  State<Loading2Scan> createState() => _Loading2ScanState();
}

class _Loading2ScanState extends State<Loading2Scan>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final AudioPlayer _audioPlayer = AudioPlayer();
  double _percent = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust the duration as needed
    )..repeat(); // Repeats the animation indefinitely

    // You can also add other animations or logic here
    Timer.periodic(const Duration(microseconds: 200000), (Timer timer) {

      setState(() {

        _percent = (_percent + 0.01).clamp(0.0, 1.0);
        if (_percent >= 1) {
          timer.cancel();
            //  _audioPlayer.play(AssetSource('sounds/success_sound.mp3'));
            _playSuccessSound();
          navigateTo(context, const SuccessfullyScan());
          // navigateAndFinish(context, const ScreeningApps());
          //SuccessfullyScan
        }
      });
    });
    
  }

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


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.maxFinite.w,
              height: double.maxFinite.h,
              child: Image.asset(
                backgroundimage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: RotationTransition(
                      turns: _controller,
                      child: Image.asset(
                        loading2,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircularPercentIndicator(
                    backgroundColor: Colors.transparent,
                    radius: 60.0,
                    lineWidth: 5.0,
                    percent: _percent,
                    center: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: SubTitle(
                          text: '${(_percent * 100).toStringAsFixed(0)}%',
                          size: 18,
                          color: textTitleColor,
                          weight: FontWeight.w600),
                    ),
                    //  Text('${(_percent * 100).toStringAsFixed(0)}%'),
                    progressColor: Colors.transparent,
                  ),
                ),
              ],
            )),
            Positioned(
              top: 550,
              right: 80,
              left: 80,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  SubTitle(
                      text: 'Scanning....'.tr(context),
                      size: 29,
                      color: textTitleColor,
                      weight: FontWeight.w700),
                  SizedBox(
                    height: 5.h,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     CustomLogo(
                  //       imageLogo: v3,
                  //       textLogo: 'Danger'.tr(context),
                  //       logoColor: v3Color,
                  //     ),
                  //     SizedBox(
                  //       width: 15.w,
                  //     ),
                  //     CustomLogo(
                  //       imageLogo: v2,
                  //       textLogo: 'Warning'.tr(context),
                  //       logoColor: v2Color,
                  //     ),
                  //     SizedBox(
                  //       width: 15.w,
                  //     ),
                  //     CustomLogo(
                  //       imageLogo: v1,
                  //       textLogo: 'Safe'.tr(context),
                  //       logoColor: v1Color,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



