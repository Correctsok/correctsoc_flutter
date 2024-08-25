import 'package:correctsoc/features/presentation/screens/setting/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_manager.dart';

class SecurityWidget extends StatelessWidget {
  const SecurityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      width: double.infinity.w,
      height: 210.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            bg9.withOpacity(0.6),
            bg9.withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.5.h,
            ),
            Image.asset(
              'assets/icons/sq1.png',
              width: 70.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            IconWidget(
              icon: privacy,
              text: 'Privacy Policy',
              onPressed: () {},
            ),
            IconWidget(
              icon: about,
              text: 'About Us',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
