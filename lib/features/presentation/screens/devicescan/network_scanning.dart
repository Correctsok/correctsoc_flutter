import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/features/presentation/screens/devicescan/widgets/custom_appbar.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/sub_title.dart';
import '../../tools/backgroundimage1.dart';

class NetworkScanning extends StatefulWidget {
  const NetworkScanning({super.key});

  @override
  State<NetworkScanning> createState() => _NetworkScanningState();
}

class _NetworkScanningState extends State<NetworkScanning> {
  final List<String> _devices = [];
  List<IconData> _deviceIcons = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scanNetwork();
  }

  Future<void> _scanNetwork() async {
    setState(() {
      _isLoading = true;
    });
    String baseIp = '192.168.1';
    for (int i = 1; i <= 255; i++) {
      String currentIp = '$baseIp.$i';
      final ping = Ping(currentIp, count: 1);
      ping.stream.listen((event) {
        if (event.response != null && event.response!.time != null) {
          setState(() {
            _devices.add(currentIp);
            _deviceIcons.length;
          });
        }
      });
    }
    _deviceIcons = [
      Icons.router,
      Icons.computer, // أيقونة للكمبيوتر
      Icons.phone_android,
      Icons.phone_iphone, // أيقونة للهاتف الذكي
      // ... إضافة المزيد من الأيقونات حسب الحاجة ... router
    ];
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          const CustomAppBar2(),
          const CustomDivider(),
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            child: SizedBox(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: _isLoading
                    ? Center(
                        child: Container(
                            width: 100,
                            height: 50,
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: const Text(
                              'Loading...........',
                              style: TextStyle(color: whiteColor),
                            )))
                    : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 50.h,
                              child: Container(
                                width: 351.w,
                                height: 58.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    colors: [bg1, bg2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Icon(
                                      _deviceIcons[index % _deviceIcons.length],
                                      color: mb,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    SubTitle(
                                        text: _devices[index],
                                        size: 15,
                                        color: mb,
                                        weight: FontWeight.w600),
                                    // const Spacer(),
                                    // const Icon(
                                    //   Icons.more_vert,
                                    //   color: mb,
                                    // )
                                    const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: _devices.length,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

