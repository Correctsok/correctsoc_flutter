import 'dart:convert';

import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/core/utils/assets_manager.dart';
import 'package:correctsoc/features/presentation/screens/pinTest/ip_scan.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/components.dart';
import '../home/home_page.dart';

class PenTest4 extends StatefulWidget {
  const PenTest4({super.key});

  @override
  State<PenTest4> createState() => _PenTest4State();
}

class _PenTest4State extends State<PenTest4>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust the duration as needed
    )..repeat(); // Repeats the animation indefinitely

    // You can also add other animations or logic here
  }

  String data = '';
  String newIp = "";

  Future<void> _fetchData() async {
    var dio = Dio();
    try {
      var response = await dio.request(
        'http://correct.somee.com/api/PortScanner/GetUserIp',
        options: Options(method: 'GET'),
      );
      if (response.statusCode == 200) {
        setState(() {
          data = json.encode(response.data['ipAddress']);
          newIp = data.split('"')[1];
        });
      } else {
        // print(response.statusMessage);
      }
    } catch (e) {
      // print(e);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              top: 40,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        navigateAndFinish(context, const  HomePageView());
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: whiteColor,
                      )),
                  const SizedBox(),
                  // InkWell(
                  //   onTap: ()=> navigateTo(context, const Setting()),
                  //   child: Image.asset(
                  //     setting,
                  //     width: 25,
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 100.w,
                  // ),
                  SubTitle(
                      text: 'Check the route',
                      size: 22,
                      color: whiteColor,
                      weight: FontWeight.w500),
                ],
              )),
          Positioned(
              top: 130,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  // SubTitle(
                  //     text: 'Self Penetration Test',
                  //     size: 22,
                  //     color: whiteColor,
                  //     weight: FontWeight.w500),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  SubTitle(
                      text: 'IP- Address Detected'.tr(context),
                      size: 18,
                      color: textTitleColor,
                      weight: FontWeight.w300),
                  SubTitle(
                      text: newIp,
                      size: 18,
                      color: textTitleColor,
                      weight: FontWeight.w300),
                ],
              )),
          Positioned(
              child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: GestureDetector(
                     onTap: () =>  navigateTo(context, const IPscan()),
                     //IPscan
                      // navigateTo(context, const PenTestResults()),
                    child: SubTitle(
                        text: 'NEXT'.tr(context),
                        size: 18,
                        color: whiteColor,
                        weight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Image.asset(dots3),
            ))
        ],
      ),
    );
  }
}
