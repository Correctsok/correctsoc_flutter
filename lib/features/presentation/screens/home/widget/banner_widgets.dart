
import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../data/shared/dio.dart';

class BannerWidgets extends StatefulWidget {
  final VoidCallback? onTap;
  const BannerWidgets({
    super.key,
    required this.onTap
  });

  @override
  State<BannerWidgets> createState() => _BannerWidgetsState();
}

class _BannerWidgetsState extends State<BannerWidgets> {
 // final ApiService _apiService = ApiService();
 //  Future<dynamic>? _advertisements;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 211.w,
            height: 141.h,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/rectangle.png'),fit: BoxFit.cover),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
            ),
          ),
          Container(
            width: 130.w,
            height: 141.h,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubTitle(text: '20% OFF', size: 22, color: whiteColor, weight: FontWeight.bold),
                  Flexible(child: SubTitle(text: 'vouchers\n FOR ALL NEW ', size: 14, color: whiteColor, weight: FontWeight.bold)),
                  SizedBox(height: 10.h,),
                  Container(
                    width: 75.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [bg10, bg11],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(child: SubTitle(text: 'Bug now', size: 10, color: whiteColor, weight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}