// ignore_for_file: avoid_unnecessary_containers

import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/features/presentation/screens/home/home_page.dart';
import 'package:correctsoc/features/presentation/screens/payment/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_bouttn.dart';

class ReceiptSummary extends StatefulWidget {
  const ReceiptSummary({super.key});

  @override
  State<ReceiptSummary> createState() => _ReceiptSummaryState();
}

class _ReceiptSummaryState extends State<ReceiptSummary> {
  final TextEditingController _promoCodeController = TextEditingController();
  final TextEditingController _discountCodeController = TextEditingController();
  final TextEditingController _displayCodeController = TextEditingController();

  // bool _isPromoCodeApplied = false;

  bool _isGreen = false;
  bool _showTextField = false;

  void _onTap() {
    setState(() {
      _isGreen = true;
    });

    _showOverlay();

    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      setState(() {
        _hideOverlay();
        _isGreen = false;
        _showTextField = true;
        _displayCodeController.text = _discountCodeController.text;
      });
    });
  }

  // void _applyPromoCode() {
  //   setState(() {
  //     _isPromoCodeApplied = true;
  //   });

  //   _showOverlay();

  //   Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
  //     _hideOverlay();
  //     setState(() {
  //       _isPromoCodeApplied = true; // Set it true to change TextField color
  //     });
  //   });
  // }

  OverlayEntry? _overlayEntry;

  void _showOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).size.height / 8 - 50,
        left: MediaQuery.of(context).size.width / 8 - 50,
        child: Center(
            child: Image.asset(
          'assets/images/icegif.gif',
          fit: BoxFit.cover,
        )),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite.w,
        height: double.maxFinite.h,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bc4.png'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          navigateTo(context, const HomePageView());
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: whiteColor,
                          size: 25,
                        )),
                    const SizedBox(),
                  ],
                ),
              ),
              Image.asset('assets/images/next1.png', width: 225.w),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 640.h,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      colors: [bg6, bg8.withOpacity(0.2)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: SubTitle(
                                text: 'Receipt Summary',
                                size: 20,
                                color: whiteColor,
                                weight: FontWeight.w600)),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: whiteColor,
                              radius: 2.5,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            SubTitle(
                                text: '10 Devices',
                                size: 16,
                                color: whiteColor,
                                weight: FontWeight.w600),
                            SizedBox(
                              width: 150.w,
                            ),
                            SubTitle(
                                text: '\$121231232'.toString(),
                                size: 16,
                                color: whiteColor,
                                weight: FontWeight.w600),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 285),
                          child: SubTitle(
                              text: '6 months',
                              size: 15,
                              color: v5Color,
                              weight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        _showTextField
                            ? Column(
                                children: [
                                  Container(
                                    width: 324.w,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      color: v6Color,
                                      borderRadius: BorderRadius.circular(10),
                                      border: _isGreen
                                          ? Border.all(color: v3Color)
                                          : Border.all(color: v1Color),
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: _displayCodeController,
                                      readOnly: true,
                                      style: TextStyle(
                                        color: _isGreen
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        fillColor: v6Color,
                                        filled: false,
                                        hintText: 'Mobile number',
                                        hintStyle: TextStyle(
                                            color: textTitleColor
                                                .withOpacity(0.3)),
                                        // errorStyle: const TextStyle(color: v1Color),
                                        // errorBorder: const OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //     color: v1Color,
                                        //     width: 2.0,
                                        //   ),
                                        // ),

                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                              'assets/icons/marc.png'),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.transparent),

                                          //BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      SubTitle(
                                          text: 'Discount',
                                          size: 16,
                                          color: whiteColor,
                                          weight: FontWeight.w600),
                                      SizedBox(
                                        width: 185.w,
                                      ),
                                      SubTitle(
                                          text: '-\$545',
                                          size: 16,
                                          color: v1Color,
                                          weight: FontWeight.w600),
                                    ],
                                  )
                                ],
                              )
                            : Container(
                                width: 324.w,
                                height: 65.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _isGreen
                                      ? Colors.green
                                      : Colors.transparent,
                                  border: _isGreen
                                      ? null
                                      : Border.all(color: Colors.white),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _isGreen
                                          ? Container()
                                          : Container(
                                              child: TextField(
                                                style: TextStyle(
                                                    color: textTitleColor
                                                        .withOpacity(0.5)),
                                                controller:
                                                    _discountCodeController,
                                                decoration: InputDecoration(
                                                  // hintText: 'Promo code',
                                                  // hintStyle: const TextStyle(
                                                  //     color: Colors.grey),
                                                  filled: false,
                                                  // fillColor: const Color(0xFF2C2C2C),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    // Padding(
                                    //     padding: const EdgeInsets.all(9.0),
                                    //     child: TextButton(
                                    //         onPressed: _onTap,
                                    //         child: _isGreen
                                    //             ? Container()
                                    //             : Container(
                                    //                 child: SubTitle(
                                    //                     text: 'Apply',
                                    //                     size: 15,
                                    //                     color: v2Color,
                                    //                     weight:
                                    //                         FontWeight.w500),
                                    //               ))),
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: _onTap,
                          child:
                          _isGreen
                              ? Container()
                              : Container(
                            width: 150.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child:  Center(
                              child: SubTitle(
                                  text: 'Apply',
                                  size: 22,
                                  color: bg7,
                                  weight:
                                  FontWeight.bold),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1.5,
                          color: whiteColor,
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 120),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SubTitle(
                                  text: 'Total price :',
                                  size: 20,
                                  color: whiteColor,
                                  weight: FontWeight.w600),
                              SizedBox(
                                width: 15.w,
                              ),
                              SubTitle(
                                  text: '1330 EGP',
                                  size: 20,
                                  color: whiteColor,
                                  weight: FontWeight.w600),
                            ],
                          ),
                        ),
                        CustomBouttn3(
                          text: 'Checkout',
                          onTap: () {
                            navigateTo(context, const PaymentMethod());
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
