// import 'package:correctsoc/config/app_localizations.dart';
// import 'package:correctsoc/core/components/components.dart';
// import 'package:correctsoc/core/components/sub_title.dart';
// import 'package:correctsoc/core/utils/app_colors.dart';
// import 'package:correctsoc/features/presentation/screens/pinTest/pen_test.dart';
// import 'package:correctsoc/features/presentation/screens/scanapp/loading_scan2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../core/components/custom_bouttn.dart';
// import '../../../../core/utils/assets_manager.dart';
// import '../devicescan/loading_device.dart';
// import '../drawer/drawer_screen.dart';
// import '../webscan/check_port.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin {
 
//   ScrollController? _scrollController;
//    AnimationController? _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 12),
//     );

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _animationController!.repeat();
//       _animationController!.addListener(() {
//         if (_scrollController!.hasClients) {
//           _scrollController!.jumpTo(
//             _animationController!.value * _scrollController!.position.maxScrollExtent,
//           );
//         }
//       });
//     });
//   }




//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const DrawerScreen(),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             SizedBox(
//               width: double.maxFinite.w,
//               height: double.maxFinite.h,
//               child: Image.asset(
//                 backgroundimage4,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 35, left: 10, right: 15),
//               child: Builder(builder: (context) {
//                 return GestureDetector(
//                   onTap: () {
//                     Scaffold.of(context).openDrawer();
//                   },
//                   child: Image.asset(
//                     menu,
//                     width: 30,
//                   ),
//                 );
//               }),
//             ),
//             Positioned(
//                 top: 135.dm,
//                 right: 0,
//                 left: 0,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SubTitle(
//                         text: 'Network Scanner'.tr(context),
//                         size: 30,
//                         color: whiteColor,
//                         weight: FontWeight.bold),
//                     SizedBox(
//                       height: 30.h,
//                     ),
//                     CustomBouttn(
//                       icon: clarity,
//                       text: 'Scan Applications'.tr(context),
//                       onTap: () => navigateTo(context, const Loading2Scan()),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     CustomBouttn(
//                       icon: 'assets/icons/dv2.png',
//                       text: 'Device Scan'.tr(context),
//                       onTap: () => navigateTo(context, const DeviceScan()),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     CustomBouttn(
//                       icon: ipaddress,
//                       text: 'Web scan'.tr(context),
//                       onTap: () => navigateTo(context, const CheckPort()),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     CustomBouttn(
//                       icon: security,
//                       text: 'Check router IP'.tr(context),
//                       onTap: () => navigateTo(context, const PenTest()),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                   ],
//                 )),
//           Positioned(
//             top: 525,
//             right: 40,
//             left: 40,
//             child: Container(
//               width: 200,
//               height: 50,
//              decoration: BoxDecoration(
//                color: subTitlecolore.withOpacity(0.3),
//                borderRadius: BorderRadius.circular(18)
//              ),
//              child: ListView(
//             controller: _scrollController,
//             scrollDirection: Axis.horizontal,
//             children: <Widget>[
//               _buildNewsItem('At CorrectSOC, our mission is to protect your privacy and ensure the'),
//               _buildNewsItem('We understand the increasing threats in the digital world, and our app'),
//               _buildNewsItem('is designed to provide you with top-notch protection against spyware'),
//               _buildNewsItem('Weather: Sunny days ahead this week'),
//               // _buildNewsItem('and malicious activities.'),
//               // _buildNewsItem('Our app is designed to detect and neutralize spyware, ensuring that'),
//               // _buildNewsItem('your personal information remains confidential.'),
//             ],
//           ),
//             ),
//             )
//           ],
//         ),
//       ),
    
//     );
//   }
//   Widget _buildNewsItem(String newsText) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 15),
//       child: Center(
//         child: Text(
//           newsText,
//           style: const TextStyle(fontSize: 18,color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

// // SelectLanguage  select_language.dart  