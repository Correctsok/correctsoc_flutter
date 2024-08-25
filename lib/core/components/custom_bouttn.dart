// ignore_for_file: must_be_immutable

import 'package:correctsoc/core/components/sub_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomBouttn extends StatelessWidget {
  String text;
  String icon;
  final VoidCallback? onTap;

  CustomBouttn({super.key, this.onTap, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 279.w,
        height: 53.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [bg1, bg2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                color: textColor,
                width: 25,
              ),
              SizedBox(
                width: 20.w,
              ),
              SubTitle(
                text: text,
                size: 15,
                color: textColor,
                weight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBouttn2 extends StatelessWidget {
  String text;
  String icon;
  final VoidCallback? onTap;

  CustomBouttn2(
      {super.key, this.onTap, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 279.w,
        height: 53.h,
       
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                color: whiteColor,
                width: 25,
              ),
              SizedBox(
                width: 30.w,
              ),
              SubTitle(
                text: text,
                size: 18,
                color: textTitleColor,
                weight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBouttn3 extends StatelessWidget {
  String text;
  final VoidCallback? onTap;

  CustomBouttn3({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 324.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [bg1, bg2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SubTitle2(
              text: text,
              size: 20,
              color: textColor,
              weight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}

class CustomBouttn4 extends StatelessWidget {
  String text;
  final VoidCallback? onTap;

  CustomBouttn4({super.key, this.onTap, required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 324.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: whiteColor),
          //   gradient: const LinearGradient(
          //     colors: [bg5, bg6],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SubTitle(
                text: text,
                size: 18,
                color: textTitleColor,
                weight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBouttn5 extends StatelessWidget {
  String text;
  final VoidCallback? onTap;

  CustomBouttn5({super.key, this.onTap, required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 279.w,
        height: 53.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [bg1, bg2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SubTitle(
                text: text,
                size: 15,
                color: textColor,
                weight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
