import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/assets_manager.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite.w,
      height: double.maxFinite.h,
      child: Image.asset(
        backgroundimage,
        fit: BoxFit.cover,
      ),
    );
  }
}

class Background2Widget extends StatelessWidget {
  const Background2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.maxFinite.w,
      height: double.maxFinite.h,
      child: Image.asset(
        backgroundimage4,
        fit: BoxFit.cover,
      ),
    );
  }
}

class BackgroundSetting extends StatelessWidget {
  const BackgroundSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.maxFinite.w,
      height: double.maxFinite.h,
      child: Image.asset(
        backgroundsetting,
        fit: BoxFit.cover,
      ),
    );
  }
}

class SuccessfullyScanImage extends StatelessWidget {
  const SuccessfullyScanImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.maxFinite.w,
      height: double.maxFinite.h,
      child: Image.asset(
        backgroundimage,
        fit: BoxFit.cover,
      ),
    );
  }
}



// BackgroundSetting  backgroundsetting

class BackgroundAboutUs extends StatelessWidget {
  const BackgroundAboutUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite.w,
      height: double.maxFinite.h,
      child: Image.asset(
        backgroundabout,
        fit: BoxFit.cover,
      ),
    );
  }
}

class BackgroundLang extends StatelessWidget {
  const BackgroundLang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite.w,
      height: double.maxFinite.h,
      child: Image.asset(
        backgroundlang,
        fit: BoxFit.cover,
      ),
    );
  }
}