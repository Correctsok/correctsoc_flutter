
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity.w,
          height: 250.h,
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
           SizedBox(width: 10.w,),
           
          ],
         ),
        ),
      ),
      );
  }
}