import 'package:correctsoc/features/presentation/screens/setting/widgets/general.dart';
import 'package:correctsoc/features/presentation/screens/setting/widgets/security_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Setting2 extends StatelessWidget {
  const Setting2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bc3.png'), fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            const GeneralWidget(),
            // SizedBox(height: 8.h,),
            const SecurityWidget(),
          ],
        ),
      ),
    ));
  }
}
