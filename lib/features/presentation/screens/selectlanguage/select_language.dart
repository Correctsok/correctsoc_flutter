import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/features/presentation/screens/home/home_page.dart';
import 'package:correctsoc/features/presentation/screens/selectlanguage/widgets/custom_boutton_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../layout/Localization/cubit/local_cubit.dart';
import '../../tools/backgroundimage1.dart';
// import '../authentication/on_bording_auth.dart';

class SelectLanguage extends StatefulWidget {
 
   const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage>
    with SingleTickerProviderStateMixin  {
   AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust the duration as needed
    )..repeat(); // Repeats the animation indefinitely

    // You can also add other animations or logic here
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

   @override
  void dispose() {
    _controller!.dispose(); // Dispose of the AnimationController
    super.dispose(); // Then call super.dispose()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLang(),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: RotationTransition(
                  turns: _controller!,
                  child: Image.asset(
                    loading2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280, left: 175, right: 185),
                child: Image.asset(
                  shield,
                  width: 70,
                ),
              ),
            ],
          ),
          BlocConsumer<LocalCubit, LocalState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 500.dg),
                  child: Container(
                    width: double.maxFinite.w,
                    height: double.maxFinite.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      gradient: LinearGradient(
                        colors: [bg1, bg2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SubTitle(
                            text: 'Select Language'.tr(context),
                            size: 24,
                            color: primary,
                            weight: FontWeight.bold),
                        SizedBox(
                          height: 35.h,
                        ),
                        CustomBouttonLang(
                          text: 'English',
                          onTap: () {
                              context.read<LocalCubit>().changeLanguage('en');
                              navigateTo(context, const HomePageView());
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomBouttonLang(
                          text: 'عربى',
                          onTap: () {
                             context.read<LocalCubit>().changeLanguage('ar');
                              navigateTo(context, const HomePageView());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
