import 'package:correctsoc/features/presentation/screens/pinTest/widgets/custom_ip.dart';
import 'package:correctsoc/features/presentation/screens/pinTest/widgets/custom_port.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomList extends StatelessWidget {
  const CustomList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 250),
        child: Column(
          children: [
            const CustomIpWidget(),
            SizedBox(
              height: 10.h,
            ),
            
            const CustomPort(),
            //  SizedBox(
            //   height: 100.h,
            // ),
            // const Portcheck(),
          ],
        ),
      ),
    );
  }
}

