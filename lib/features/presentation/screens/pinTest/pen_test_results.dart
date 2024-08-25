import 'package:correctsoc/features/presentation/screens/pinTest/widgets/custom_list.dart';
import 'package:correctsoc/features/presentation/tools/widgets/custom_appbar.dart';
import 'package:correctsoc/features/presentation/tools/widgets/open_portwidget.dart';
import 'package:correctsoc/features/presentation/tools/backgroundimage1.dart';
import 'package:flutter/material.dart';



class PenTestResults extends StatelessWidget {
  const PenTestResults({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body:  const Stack(
        children: [
          Background2Widget(),
          CustomAppBar(),
          CustomDivider(),
          OpenPortWidget(),
          CustomList(),
        ],
      ),
    );
  }
}


