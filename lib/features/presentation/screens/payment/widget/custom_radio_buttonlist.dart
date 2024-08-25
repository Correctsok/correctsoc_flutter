
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/sub_title.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomRadioButtonList extends StatelessWidget {
  String title;
  final groupValue;
  final value;
  Function(dynamic) onChanged;
  CustomRadioButtonList(
      {super.key,
        required this.value,
        required this.groupValue,
        required this.title,
        required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _customRadioButton2(),
          SizedBox(width: 12.w,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                SizedBox(height: 16,),
                Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: SubTitle(text: 'Activation Code', size: 12, color: whiteColor, weight: FontWeight.w600),
                    ),
                    SubTitle(text: 'The code that sent by Distributors', size: 9, color: textTitleColor, weight: FontWeight.w600),
                  ],
                ),



              ],
            ),
          ),
          SizedBox(height: 6.w,),
          // SubTitle(text: 'Pay directly from your bank account', size: 12, color: textTitleColor, weight: FontWeight.w600),
        ],
      ),
      //  ListTile(
      //   leading: _customRadioButton(context),
      //   title: Image.asset(title,width: 35,),
      // ),
    );
  }










  Widget _customRadioButton2() {
    bool isSelected = value == groupValue;

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isSelected ? bg1 : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: bg7),
      ),
      child: Center(
          child: isSelected
              ? const Icon(
            Icons.check,
            size: 20,
            color: bg7,
          )
              : const SizedBox.shrink()),
    );
  }
}


class CustomRadioButtonListTile extends StatelessWidget {
  String title;
  final groupValue;
  final value;
  Function(dynamic) onChanged;
  CustomRadioButtonListTile(
      {super.key,
        required this.value,
        required this.groupValue,
        required this.title,
        required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _customRadioButton(),
          SizedBox(width: 12.w,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(right: 160),
                  child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: bg2),
                      ),
                      child: Image.asset(title,width: 30.w,)),
                ),
                SizedBox(height: 10,),
                const Text('Pay directly from your bank account',style: TextStyle(color: textTitleColor),),

              ],
            ),
          ),
          SizedBox(height: 6.w,),
          // SubTitle(text: 'Pay directly from your bank account', size: 12, color: textTitleColor, weight: FontWeight.w600),
        ],
      ),
      //  ListTile(
      //   leading: _customRadioButton(context),
      //   title: Image.asset(title,width: 35,),
      // ),
    );



}

  Widget _customRadioButton() {
    bool isSelected = value == groupValue;

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isSelected ? bg1 : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: bg7),
      ),
      child: Center(
          child: isSelected
              ? const Icon(
            Icons.check,
            size: 20,
            color: bg7,
          )
              : const SizedBox.shrink()),
    );
  }
}
