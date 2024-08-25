
import 'package:correctsoc/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../webscan/check_port.dart';

class Portcheck extends StatelessWidget {
  const Portcheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>navigateTo(context, const CheckPort()),
      child: Container(
        width: 351.w,
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [bg1, bg2],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
          const Icon(Icons.offline_pin_rounded,color: whiteColor,),
             
              SizedBox(
                width: 10.w,
              ),
              SubTitle(
                  text: 'Portcheck',
                  size: 22,
                  color: whiteColor,
                  weight: FontWeight.w500),
            ],
          ),
        ),
      ),
    );
  }
}
