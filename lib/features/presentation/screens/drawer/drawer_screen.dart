import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/features/presentation/screens/drawer/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/sub_title.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../tools/backgroundimage1.dart';
import '../aboutus/about_us.dart';
import '../payment/payment_details.dart';
import '../setting/setting2.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 255.w,
        elevation: 0,
        child: Stack(
          children: [
            const Background2Widget(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 400),
              child: Image(
                image: const AssetImage(
                  logoimage,
                ),
                fit: BoxFit.cover,
                width: 200.w,
              ),
            ),
          ),
         Padding(
          padding: const EdgeInsets.only(top: 140,),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                 Align(
                  alignment: Alignment.centerLeft,
                   child: Container(
                        width: 240.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [bg10, bg11],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child:  Column(
                          
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   Flexible(child: SubTitle(text: 'Premium Account', size: 16, color: whiteColor, weight: FontWeight.bold)),
                                    Image.asset('assets/icons/premium.png',width: 25,),
                                                 
                                ],
                              ),
                            ),
                          Flexible(
                            
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 9,left: 5),
                              child: Align(
                              alignment: Alignment.centerLeft,
                              child: SubTitle(text: '180 Days', size: 16, color: whiteColor, weight: FontWeight.bold)),
                            )),
                          ],
                        ),
                      ),
                 ),
                    SizedBox(height: 40.h,),
                 DrawerWidget(
              text: 'Buy premium pro'.tr(context),
              icon: premium,
              onTap: () {
                navigateTo(context, const PaymentDetails());
              },
            ),
            SizedBox(height: 40.h,),
            DrawerWidget(
              text: 'Get Support'.tr(context),
              icon: support,
              onTap: () {},
            ),
             SizedBox(height: 40.h,),
            DrawerWidget(
              text: 'Setting'.tr(context),
              icon: setting,
              onTap: () => navigateTo(context, const Setting2()),
            ),
          
             SizedBox(height: 40.h,),
            DrawerWidget(
              text: 'About Us'.tr(context),
              icon: about,
              onTap: () => navigateTo(context, const AboutUs()),
            ),
             SizedBox(height: 40.h,),
            DrawerWidget(
              text: 'Log Out',
              icon: logout,
              onTap: () {},
            ),
              ],
            ),
          ),
         )
          ],
        ),
      ),
    );
  }
}
