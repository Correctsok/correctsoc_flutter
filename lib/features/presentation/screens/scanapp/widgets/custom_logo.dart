

import 'package:flutter/widgets.dart';

import '../../../../../core/components/sub_title.dart';

class CustomLogo extends StatelessWidget {
   String textLogo;
  String imageLogo;
  Color logoColor;
   CustomLogo({
    super.key,
    required this.imageLogo,
    required this.textLogo,
    required this.logoColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageLogo),
        SubTitle(text: textLogo, size: 12, color: logoColor, weight: FontWeight.w600),
      ],
    );
  }
}