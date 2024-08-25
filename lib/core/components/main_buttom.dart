// ignore_for_file: must_be_immutable
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class MainButtom extends StatelessWidget {
  String text;
  final VoidCallback? onTap;
  MainButtom({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width * 0.7,
        height: 50,
        decoration: BoxDecoration(
          color: mb.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: SubTitle(
            color: Colors.white,
            text: text,
            size: 16.5,
            weight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
