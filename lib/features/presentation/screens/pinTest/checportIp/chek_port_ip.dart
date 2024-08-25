import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../data/model/ip_data.dart';

class ChekPortIP extends StatefulWidget {
  const ChekPortIP({
    super.key,
    required Future<List<IPData>> ipDataFuture,
  }) : _ipDataFuture = ipDataFuture;

  final Future<List<IPData>> _ipDataFuture;

  @override
  State<ChekPortIP> createState() => _ChekPortIPState();
}

class _ChekPortIPState extends State<ChekPortIP> {
  bool _isTimerCompleted = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 60), () {
      setState(() {
        _isTimerCompleted = true;
        _playSuccessSound();
      });
    });
  }

  void _playSuccessSound() {
    Locale currentLocale = Localizations.localeOf(context);
    String languageCode = currentLocale.languageCode;
    String soundFile;

    switch (languageCode) {
      case 'ar':
        soundFile = 'sounds/url_secure_ar.mp3';
        break;
      case 'en':
      default:
        soundFile = 'sounds/url_insecure_en.mp3';
        break;
    }

    _audioPlayer.play(AssetSource(soundFile));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: FutureBuilder<List<IPData>>(
        future: widget._ipDataFuture,
        builder: (context, snapshot) {
          if (!_isTimerCompleted) {
            return Center(
                child: Column(
              children: [
                SubTitle(
                    text: 'Please wait a moment'.tr(context),
                    size: 18,
                    color: whiteColor,
                    weight: FontWeight.w500),
                const CircularProgressIndicator(
                  color: textTitleColor,
                ),
              ],
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Data Found'));
          } else {
            List<IPData> ipData = snapshot.data!;
            return ListView.builder(
              itemCount: ipData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity.w,
                    height: 280.h,
                    decoration: BoxDecoration(
                      color: bg5.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 2.5.w,
                          height: 210.h,
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              'Port: ${ipData[index].port}',
                              style: const TextStyle(
                                color: textTitleColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Service: ${ipData[index].service}\n'
                                    'Protocol: ${ipData[index].protocol}\n'
                                    'Version: ${ipData[index].version}\n'
                                    'CVE Count: ${ipData[index].cvEcount}\n'
                                    'CSS Score: ${ipData[index].cssScore}',
                                    style: const TextStyle(
                                      color: textTitleColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'CVEs : [..]',
                                      style: const TextStyle(
                                        color: textTitleColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CveDetailsScreen(
                                                      cvEsInformation:
                                                          ipData[index]
                                                              .cvEsInformation),
                                            ),
                                          );
                                        },
                                        child: Image.asset(hugeicons)),
                                  ],
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CveDetailsScreen(
                                      cvEsInformation:
                                          ipData[index].cvEsInformation),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CveDetailsScreen extends StatelessWidget {
  final List<dynamic> cvEsInformation;

  const CveDetailsScreen({super.key, required this.cvEsInformation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CVEs Information'),
      ),
      body: ListView.builder(
        itemCount: cvEsInformation.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cvEsInformation[index].toString()),
          );
        },
      ),
    );
  }
}
