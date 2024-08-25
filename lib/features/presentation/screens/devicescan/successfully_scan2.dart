import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/features/presentation/screens/devicescan/network_scanning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/sub_title.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../tools/backgroundimage1.dart';

class SuccessfullyScan2 extends StatefulWidget {
  const SuccessfullyScan2({super.key});

  @override
  State<SuccessfullyScan2> createState() => _SuccessfullyScan2State();
}

class _SuccessfullyScan2State extends State<SuccessfullyScan2> {
    bool _isLoading = false;

   Future<void> _startLoading() async {
    setState(() {
      _isLoading = true;
    });

    // محاكاة عملية التحميل
    await Future.delayed(const Duration(seconds: 2));
     navigateAndFinish(context, const NetworkScanning());
    setState(() {
      _isLoading = false;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SuccessfullyScanImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(successfullyscanImage2),
                  width: 250.w,
                ),
                SizedBox(height: 30.h,),
                SubTitle(text: 'Scan successfully Done'.tr(context), size: 25, color: textTitleColor, weight: FontWeight.w500),
              ],
            ),
          ),
          Positioned(
            top: 600.dg,
            left: 60,
            right: 60,
            child:_isLoading
            ?const Center(child:   CircularProgressIndicator(color: whiteColor,))
            : Container(
              width: 279.w,
              height: 53.h,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: _startLoading,
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
