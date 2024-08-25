import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/features/presentation/screens/home/widget/banner_widgets.dart';
import 'package:correctsoc/features/presentation/screens/pinTest/pen_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/sub_title.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../devicescan/loading_device.dart';
import '../drawer/drawer_screen.dart';
import '../scanapp/loading_scan2.dart';
import '../webscan/check_port.dart';
import 'banner_info.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                backgroundimage4,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            menu,
                            width: 30,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          SubTitle(
                              text: 'Services'.tr(context),
                              size: 25,
                              color: whiteColor,
                              weight: FontWeight.bold),
                        ],
                      ),
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetContainer2(
                      title: 'Scan Applications'.tr(context),
                      icon: 'assets/images/contx1.png',
                      onTap: () => navigateTo(context, const Loading2Scan()),
                    ),
                    WidgetContainer2(
                      title: 'Web Scan'.tr(context),
                      icon: 'assets/images/contx2.png',
                      onTap: () => navigateTo(context, const CheckPort()),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 0.5.h,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetContainer2(
                      title: 'Check Router'.tr(context),
                      icon: 'assets/images/contx3.png',
                      onTap: () => navigateTo(context, const PenTest()),
                    ),
                    WidgetContainer2(
                      title: 'Device Scan'.tr(context),
                      icon: 'assets/images/contx4.png',
                      onTap: () => navigateTo(context, const DeviceScan()),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BannerWidgets(
                  onTap: () {
                    navigateTo(context, const BannerInfo());
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetContainer2 extends StatelessWidget {
  String title;
  String icon;
  final VoidCallback? onTap;
  WidgetContainer2({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Image.asset(
              icon,
              width: 170.w,
              fit: BoxFit.cover,
            ),
            Positioned(
                top: 165,
                left: 53,
                right: 50,
                child: Center(
                  child: SubTitle2(
                      text: title,
                      size: 8.5,
                      color: whiteColor,
                      weight: FontWeight.w600),
                )),
          ],
        ));
  }
}
