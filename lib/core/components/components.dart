// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );



void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
}

  //  SizedBox(height: 35.h,),
            // DrawerWidget(
            //   text: 'Free reward'.tr(context),
            //   icon: marketeq,
            //   onTap: () {},
            // ),
            //  SizedBox(height: 35.h,),
            // DrawerWidget(
            //   text: 'Rate Us'.tr(context),
            //   icon: star,
            //   onTap: () {
            //     navigateTo(context, const RatingScreen());
            //   },
            // ),

// bool _isPromoCodeApplied = false;

//   void _applyPromoCode() {
//     setState(() {
//       _isPromoCodeApplied = true;
//     });

//     _showOverlay();

//     Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
//       _hideOverlay();
//       setState(() {
//         _isPromoCodeApplied = true;  // Set it true to change TextField color
//       });
//     });
//   }

//   OverlayEntry? _overlayEntry;

//   void _showOverlay() {
//     _overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         bottom: MediaQuery.of(context).size.height / 8 - 50,
//         left: MediaQuery.of(context).size.width /8 - 50,
//         child: Center(child: Image.asset('assets/images/icegif.gif',fit: BoxFit.cover,)),
//       ),
      
//     );

//     Overlay.of(context).insert(_overlayEntry!);
    
    
    
//   }

//   void _hideOverlay() {
//     _overlayEntry?.remove();
//   }