import 'package:flutter/material.dart';

import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';

class IconWidget extends StatelessWidget {
  String text;
  String icon;
  final VoidCallback? onPressed;
  IconWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 40,
          ),
          // SizedBox(width: 0.5.w,),
          TextButton(
              onPressed: onPressed,
              child: SubTitle(
                  text: text,
                  size: 16,
                  color: whiteColor,
                  weight: FontWeight.w600))
        ],
      ),
    );
  }
}
