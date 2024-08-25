import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_manager.dart';

class CustomIpWidget extends StatefulWidget {
  const CustomIpWidget({
    super.key,
  });

  @override
  State<CustomIpWidget> createState() => _CustomIpWidgetState();
}

class _CustomIpWidgetState extends State<CustomIpWidget> {
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
        if (kDebugMode) {
          print(response.statusMessage);
        }
      }
    } catch (e) {
      // print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351.w,
      height: 58.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [bg5, bg6],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(laptop),
            SizedBox(
              width: 10.w,
            ),
            SubTitle(
                text: newIp,
                size: 22,
                color: whiteColor,
                weight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
