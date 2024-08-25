
import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/core/components/sub_title.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/features/presentation/screens/home/home_page.dart';
import 'package:correctsoc/features/presentation/screens/payment/payment_method.dart';
import 'package:correctsoc/features/presentation/screens/payment/receipt_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_bouttn.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String? _selectedDuration;
  int devices = 1;
  int months = 0;
  int years = 0;
  int _price = 0;
  String token = "";

  bool _showPrice = false;

  void _updatePrice() {
    int deviceCount = int.tryParse(_deviceNumberController.text) ?? 0;
    int durationMultiplier;

    switch (_selectedDuration) {

      case '6 months':
        durationMultiplier = 6;
        break;
      case '1 year':
        durationMultiplier = 12;
        break;
      default:
        durationMultiplier = 0;
    }

    setState(() {
      _price = deviceCount * 100 * durationMultiplier; // افتراض أن تكلفة الجهاز الواحد هي 100 EGP لكل شهر
      _showPrice = deviceCount > 0 && durationMultiplier > 0;
    });
  }

  void _incrementDeviceCount() {
    setState(() {
      int currentCount = int.tryParse(_deviceNumberController.text) ?? 0;
      _deviceNumberController.text = (currentCount + 1).toString();
      _updatePrice();
    });
  }

  void _decrementDeviceCount() {
    setState(() {
      int currentCount = int.tryParse(_deviceNumberController.text) ?? 0;
      if (currentCount > 0) {
        _deviceNumberController.text = (currentCount - 1).toString();
        _updatePrice();
      }
    });
  }


  final TextEditingController _deviceNumberController = TextEditingController();
  final List<String> durations = ['6 months', '12 months'];
  String? selectedDuration;
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SubTitle(
                              text: 'Payment Details',
                              size: 20,
                              color: whiteColor,
                              weight: FontWeight.w600)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SubTitle(
                              text: 'Enter your information',
                              size: 20,
                              color: textTitleColor.withOpacity(0.5),
                              weight: FontWeight.w600)),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: SubTitle(
                                text: 'Device Number',
                                size: 17,
                                color: textTitleColor.withOpacity(0.5),
                                weight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 324.w,
                        height: 60.h,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         border: Border.all(color: Colors.white),
                       ),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              _decrementDeviceCount();
                            }, icon: const Icon(Icons.minimize,color: whiteColor,size: 18,)),
                            // SubTitle(text: '$devices', size: 15, color: Colors.white, weight: FontWeight.w500),
                            Expanded(
                              child: Padding(
                                padding:  EdgeInsets.only(left: 120.dm),
                                child: TextField(
                                  controller: _deviceNumberController,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(color: whiteColor,),
                                  onChanged: (value) {
                                    _updatePrice();
                                  },
                                  decoration: const InputDecoration(

                                  ),
                                ),
                              ),
                            ),
                            IconButton(onPressed: (){
                              _incrementDeviceCount();
                            }, icon: const Icon(Icons.add,color: whiteColor,size: 18,)),
                          ],
                        ),
                        // TextFormField(
                        //   controller: _deviceNumberController,
                        //   keyboardType: TextInputType.number,
                        //   style: const TextStyle(color: whiteColor),
                        //   onChanged: (value) {
                        //      _updatePrice();
                        //     // devices = int.tryParse(value) ?? 0;
                        //     // if (devices > 0 && months > 0) {
                        //     //   getCost(devices, months, years);
                        //     // }
                        //   },
                        //   decoration: InputDecoration(
                        //     fillColor: Colors.transparent,
                        //     filled: false,
                        //     hintText: 'Enter number of your devices',
                        //     hintStyle: TextStyle(
                        //         color: textTitleColor.withOpacity(0.5)),
                        //     border: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: whiteColor),
                        //       //BorderSide.none,
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //   ),
                        // ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: SubTitle(
                                text: 'Duration',
                                size: 17,
                                color: textTitleColor.withOpacity(0.5),
                                weight: FontWeight.w600)),
                      ),
                      Container(
                        width: 324.w,
                        height: 70.h,
                        child: DropdownButtonFormField<String>(
                          padding: const EdgeInsets.all(8.0),
                          value: selectedDuration,
                          items: durations.map((String duration) {
                            return DropdownMenuItem<String>(
                              value: duration,
                              child: Text(duration),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                               setState(() {
                  _selectedDuration = newValue;
                });
                _updatePrice();
                            // setState(() {
                            //   selectedDuration = newValue;
                            //   months = (newValue == '6 months') ? 6 : 12;
                            //   if (devices > 0 && months > 0) {
                            //     getCost(devices, months, years);
                            //   }
                            // });
                          },
                          decoration: InputDecoration(
                            hintText: 'Select',
                            hintStyle: const TextStyle(color: Colors.white),
                            filled: false,
                            // fillColor: Colors.white24,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: whiteColor),
                            ),
                          ),
                          dropdownColor: Colors.grey,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                        if (_showPrice)
                      const Divider(
                        thickness: 1.5,
                        color: whiteColor,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                       if (_showPrice)
                      Container(
                        width: 324.w,
                        height: 77.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: whiteColor),
                        ),
                        child: Center(
                            child: SubTitle(
                          text: 'Total price : $_price EGP',
                          size: 18,
                          color: whiteColor,
                          weight: FontWeight.w500,
                        )),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomBouttn3(
                        text: 'Checkout',
                        onTap: () {
                          navigateTo(context, const ReceiptSummary());
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getCost(int device, int months, int year) {
    // Dummy implementation, replace with actual API call
    setState(() {
      _price = device * months * 10; // Example calculation
    });
  }

  void orderGooglePay() {
    // Dummy implementation, replace with actual API call
    setState(() {
      token = 'dummy_token';
    });

    // Navigate to next screen or do other actions
  }
}
//PaymentMethod payment_method.dart  receipt_summary.dart ReceiptSummary