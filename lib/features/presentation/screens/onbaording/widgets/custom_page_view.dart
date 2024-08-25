
import 'package:correctsoc/features/presentation/screens/onbaording/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';

class CustomPageView  extends StatelessWidget {
   final PageController? pageController;
   const CustomPageView ({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
       PageViewItem(
        image:  view1,
        //  dots:  frame212,
         ),
            PageViewItem(
        image:  view2,
        //  dots:  frame213,
         ),
            PageViewItem(
        image:  view3,
        //  dots:  frame214,
         ),
           PageViewItem(
        image:  view4,
        //  dots:  frame215,
         ),
      ],
    );
  }
}