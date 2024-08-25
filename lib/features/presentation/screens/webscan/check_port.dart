// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/features/presentation/screens/webscan/widgets/custom_appbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../data/model/web_model.dart';
import '../../tools/backgroundimage1.dart';

class CheckPort extends StatefulWidget {
  const CheckPort({super.key});

  @override
  State<CheckPort> createState() => _CheckPortState();
}

class _CheckPortState extends State<CheckPort>
    with SingleTickerProviderStateMixin
{
  final TextEditingController _controller = TextEditingController();
  late AnimationController _controllerr;
  final bool _isLoading = false;
  List<WebData> data = [];
  bool isLoading = false; // حالة التحميل
  final AudioPlayer _audioPlayer = AudioPlayer();
  double _percent = 0.0;

  @override
  void initState() {
    super.initState();
    _controllerr = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust the duration as needed
    )..repeat(); // Repeats the animation indefinitely

    // You can also add other animations or logic here
    //  Future.delayed(const Duration(seconds: 6), () {
    //   // Navigator.of(context).pushReplacementNamed(Routes.onbording);
    //   navigateAndFinish(context, const PenTestResults());
    // });
    Timer.periodic(const Duration(seconds: 1,milliseconds: 1000), (Timer timer) {
      setState(() {
        _percent = (_percent + 0.01).clamp(0.0, 1.0);
        if (_percent >= 1) {
          timer.cancel();

        }
      });
    });
  }


  void fetchData(String url) async {
    setState(() {
      isLoading = true; // بدء التحميل

    });


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


    var dio = Dio();
    try {
      var response = await dio.request(
        'http://correct.somee.com/api/PortScanner/nmap?input=$url',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          data = webDataFromJson(json.encode(response.data));
          isLoading = false;
          _playSuccessSound();// انتهاء التحميل
        });
      } else {
        setState(() {
          data = [];
          isLoading = false; // انتهاء التحميل
        });
      }
    } catch (e) {
      setState(() {
        data = [];
        isLoading = false; // انتهاء التحميل
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Background2Widget(),
            const CustomAppBar4(),
            const CustomDivider(),
            Positioned(
              top: 110,
              left: 0,
              right: 0,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 800.h,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(color: whiteColor),
                          controller: _controller,
                          decoration: InputDecoration(
                           
                            fillColor: Colors.transparent,
                            filled: false,
                            hintText: 'Enter URL'.tr(context),
                           hintStyle: const TextStyle(color: textTitleColor),
                            prefixIcon: const Icon(
                              Icons.link,
                              color:textTitleColor,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: whiteColor),
                              //BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     fetchData(_controller.text);
                        //   },
                        //   child:  Text('Start Scan'.tr(context)),
                        // ),
                        // TextButton(onPressed: (){
                        //   fetchData(_controller.text);
                        // }, child: SubTitle(text: 'start scan'.tr(context), size: 25, color: textTitleColor, weight: FontWeight.w600)),
                        InkWell(
                          onTap: (){
                            fetchData(_controller.text);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 250.w,
                              height: 50,
                              decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [bg1, bg2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
        ),
        ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30,right: 25),
                                child: Center(child: SubTitle(text: 'start scan'.tr(context), size: 25, color: bg7, weight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        isLoading
                        ? Stack(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 1.5, left: 10, right: 10),
                                child: RotationTransition(
                                  turns: _controllerr,
                                  child: Image.asset(
                                    loading2,
                                    width: 200.w,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 110),
                                child: CircularPercentIndicator(
                                  backgroundColor: Colors.transparent,
                                  radius: 60.0,
                                  lineWidth: 5.0,
                                  percent: _percent,
                                  center: SubTitle(
                                      text: '${(_percent * 100).toStringAsFixed(0)}%',
                                      size: 18,
                                      color: textTitleColor,
                                      weight: FontWeight.w600
                                  ),
                                  //  Text('${(_percent * 100).toStringAsFixed(0)}%'),
                                  progressColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        )
                            // ? Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       const CircularProgressIndicator(
                            //         color: textTitleColor,
                            //       ),
                            //       SizedBox(
                            //         height: 25.h,
                            //       ),
                            //       SubTitle(
                            //           text: 'Please wait a moment'.tr(context),
                            //           size: 18,
                            //           color: textTitleColor,
                            //           weight: FontWeight.w500)
                            //     ],
                            //   ) // عرض مؤشر التحميل أثناء انتظار البيانات
                            : Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    final item = data[index];
                                    return Card(
                                      color: Colors.white.withOpacity(0.1),
                                      child: ListTile(
                                        title: Align(
                                            alignment: Alignment.centerLeft,
                                            child: SubTitle(
                                                text: 'Port: ${item.port}',
                                                size: 15,
                                                color: whiteColor,
                                                weight: FontWeight.w500)),
                                        //  Text('Port: ${item.port}'),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SubTitle(
                                                text: 'Service: ${item.service}',
                                                size: 15,
                                                color: textTitleColor,
                                                weight: FontWeight.w500),
                                            SubTitle(
                                                text:
                                                    'Protocol: ${item.protocol}',
                                                size: 15,
                                                color: textTitleColor,
                                                weight: FontWeight.w500),
                                            SubTitle(
                                                text: 'Version: ${item.version}',
                                                size: 15,
                                                color: textTitleColor,
                                                weight: FontWeight.w500),
                                            SubTitle(
                                                text:
                                                    'CVE Count: ${item.cvEcount}',
                                                size: 15,
                                                color: textTitleColor,
                                                weight: FontWeight.w500),
                                            SubTitle(
                                                text:
                                                    'CSS Score: ${item.cssScore}',
                                                size: 15,
                                                color: textTitleColor,
                                                weight: FontWeight.w500),
                                            SubTitle(
                                                text:
                                                    'CVEs: ${item.cvEsInformation.join(', ')}',
                                                size: 15,
                                                color: textTitleColor,
                                                weight: FontWeight.w500),
                                            // Text('Service: ${item.service}'),
                                            // Text('Protocol: ${item.protocol}'),
                                            // Text('Version: ${item.version}'),
                                            // Text('CVE Count: ${item.cvEcount}'),
                                            // Text('CSS Score: ${item.cssScore}'),
                                            // Text('CVEs: ${item.cvEsInformation.join(', ')}'),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
