import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/core/utils/assets_manager.dart';
import 'package:correctsoc/features/presentation/screens/scanapp/scana_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../setting/setting_screen.dart';

class LoadingScan extends StatefulWidget {
  const LoadingScan({super.key});

  @override
  State<LoadingScan> createState() => _LoadingScanState();
}

class _LoadingScanState extends State<LoadingScan>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust the duration as needed
    )..repeat(); // Repeats the animation indefinitely

    // You can also add other animations or logic here
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite.w,
            height: double.maxFinite.h,
            child: Image.asset(
              backgroundimage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 60,
              right: 15,
              child: InkWell(
                onTap: ()=> navigateTo(context, const Setting()),
                child: Image.asset(
                  setting,
                  width: 30,
                ),
              )),
          Positioned(
              child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                child: RotationTransition(
                  turns: _controller,
                  child: Image.asset(
                    loading,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 290, left: 160, right: 160),
                child: Image.asset(
                  shield,
                  width: 100,
                ),
              ),
            ],
          )
          ),
          Positioned(
            top: 500,
            right: 80,
            left: 80,
            child: Column(
              children: [
                Image.asset(fr,width:250,fit:BoxFit.cover,),
                SizedBox(
                  height: 60.h,
                ),
                GestureDetector(
                  onTap: () => navigateTo(context, const LoadingScan2()),
                  child: Container(
                    width: 500.w,
                    height: 50,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: SubTitle(
                            text: 'Scan',
                            size: 22,
                            color: subTitlecolore,
                            weight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
