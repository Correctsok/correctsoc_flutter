import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/features/presentation/screens/devicescan/successfully_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/components/components.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../tools/backgroundimage1.dart';

class DeviceScan extends StatefulWidget {
  const DeviceScan({super.key});

  @override
  State<DeviceScan> createState() => _DeviceScanState();
}

class _DeviceScanState extends State<DeviceScan>
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
    // Future.delayed(const Duration(seconds: 10), () {
    //   // Navigator.of(context).pushReplacementNamed(Routes.onbording);
    //   navigateAndFinish(context, const NetworkScanning());
    // });

    Timer.periodic(const Duration(microseconds: 400000), (Timer timer) {
      setState(() {
        _percent = (_percent + 0.01).clamp(0.0, 1.0);
        if (_percent >= 1) {
          timer.cancel();
            _playSuccessSound();
          navigateTo(context, const SuccessfullyScan2());
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
            const Background2Widget(),
            Positioned(
                child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 5, right: 5),
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
                      padding: const EdgeInsets.only(top: 50),
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
            Center(
              child: Padding(
                padding:  EdgeInsets.only(top: 500.dg),
                child: SubTitle(
                    text: 'Scanning....'.tr(context),
                    size: 30,
                    color: whiteColor,
                    weight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  padding: const EdgeInsets.only(top: 300, left: 155, right: 155),