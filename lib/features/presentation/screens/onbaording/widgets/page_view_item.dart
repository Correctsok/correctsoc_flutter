
import 'package:flutter/material.dart';

class PageViewItem  extends StatelessWidget {
  String image;
  // String dots;

  PageViewItem({super.key,  required this.image});
 

  @override
  Widget build(BuildContext context) {
    return  Center(child: Image.asset(image,width: 330,));
  }
}