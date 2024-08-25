
import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/features/presentation/screens/setting/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../authentication/updateInfo/update_screen_info.dart';

class GeneralWidget extends StatelessWidget {
  const GeneralWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      width: double.infinity.w,
      height: 500.h,
      decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient:  LinearGradient(
    colors: [ bg9.withOpacity(0.6),bg9.withOpacity(0.2),],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
                ),
              ),
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30.h,),
                    Image.asset('assets/icons/generalicon.png',width: 70.w,),
                    SizedBox(height: 10.h,),
                     IconWidget(
                      icon: carbonedit,
                      text: 'Update Info',
                      onPressed: () {
                        navigateTo(context, const UpdateInfo());
                      },
                      ),
                       IconWidget(
                      icon: secure,
                      text: 'Change Password',
                      onPressed: () {},
                      ),
                    IconWidget(
                      icon: notification,
                      text: 'Notification setting',
                      onPressed: () {},
                      ),
                       IconWidget(
                      icon: language,
                      text: 'Language',
                      onPressed: () {},
                      ),
                       IconWidget(
                      icon: feedbackoutline,
                      text: 'Send Feedback',
                      onPressed: () {},
                      ),
                      IconWidget(
                      icon: shareoutline,
                      text: 'Share with friends',
                      onPressed: () {},
                      ),
                  ],
                ),
              ),
    );
  }
}