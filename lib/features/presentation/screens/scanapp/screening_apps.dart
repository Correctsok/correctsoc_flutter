import 'package:audioplayers/audioplayers.dart';
import 'package:correctsoc/features/presentation/screens/scanapp/widgets/custom_appbar.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/components/sub_title.dart';
import '../../../../core/utils/app_colors.dart';
import '../../tools/backgroundimage1.dart';

class ScreeningApps extends StatefulWidget {
  const ScreeningApps({super.key});

  @override
  State<ScreeningApps> createState() => _ScreeningAppsState();
}

class _ScreeningAppsState extends State<ScreeningApps>  {
  List<Application>? _apps;
  // final AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();

    _fetchApps();
  }

  // void _playSuccessSound() {
  //   Locale currentLocale = Localizations.localeOf(context);
  //   String languageCode = currentLocale.languageCode;
  //   String soundFile;
  //
  //   switch (languageCode) {
  //     case 'ar':
  //       soundFile = 'sounds/secure_ar.mp3';
  //       break;
  //     case 'en':
  //     default:
  //       soundFile = 'sounds/secure_en.mp3';
  //       break;
  //   }
  //
  //   _audioPlayer.play(AssetSource(soundFile));
  // }
  
   

  // void _fetchApps() async {
  //   List<Application> apps = await DeviceApps.getInstalledApplications(
  //     // includeSystemApps: true,
  //     includeAppIcons: true,
  //   );
  //   setState(() {
  //     _apps = apps;
  //   });
  //  }

 //*************************/ 

//   void _fetchApps() async {
//   List<Application> apps = await DeviceApps.getInstalledApplications(
//     includeAppIcons: true,
//   );

//   // Filter out apps that are likely installed from the Play Store
//   List<Application> nonPlayStoreApps = apps.where((app) {
//     return !(app as ApplicationWithIcon).systemApp;
//   }).toList();

//   setState(() {
//     _apps = nonPlayStoreApps;
//   });
// }

//*****************************************/

// void _fetchApps() async {
//   List<Application> apps = await DeviceApps.getInstalledApplications(
//     includeAppIcons: true,
//   );

//   // تصفية التطبيقات المثبتة من خارج متجر Google Play
//   List<Application> nonPlayStoreApps = apps.where((app) {
//     if (app is ApplicationWithIcon) {
//       // نعتبر أن التطبيقات التي ليست تطبيقات نظام هي تطبيقات مثبتة من خارج المتجر
//       return !app.systemApp;
//     }
//     return false;
//   }).toList();

//   setState(() {
//     _apps = nonPlayStoreApps;
//   });
// }

//   void _uninstallApp(String packageName) async {
//     // Immediately remove the app from the list
//     setState(() {
//       _apps = _apps?.where((app) => app.packageName != packageName).toList();
//     });

//     // Launch the uninstallation process
//     bool uninstalled = await DeviceApps.uninstallApp(packageName);
//     if (uninstalled) {
//       // Optionally, you can refresh the list of installed apps if needed
//       _fetchApps();
//     } else {
//       // If uninstallation was cancelled, re-add the app back to the list
//       _fetchApps();
//     }
//   }
//***********************************************/

//*******************************************/
 void _fetchApps() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      onlyAppsWithLaunchIntent: true, // This will include only visible apps
    );

    // Get the list of all apps including hidden ones
    List<Application> allApps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      onlyAppsWithLaunchIntent: false, // This will include all apps
    );

    // Filter out the visible apps from all apps to get hidden apps
    List<ApplicationWithIcon> hiddenApps = allApps.where((app) {
      if (app is ApplicationWithIcon) {
        return !apps.contains(app);
      }
      return false;
    }).cast<ApplicationWithIcon>().toList();

    setState(() {
      _apps = hiddenApps;
    });
  }
  //***********************************/

  //   void _fetchApps() async {
  //   List<Application> apps = await DeviceApps.getInstalledApplications(
  //     includeAppIcons: true,
  //   );

  //   // تصفية التطبيقات المثبتة من ملفات APK فقط
  //   List<ApplicationWithIcon> apkApps = apps.where((app) {
  //     if (app is ApplicationWithIcon) {
  //       // نعتبر أن التطبيقات غير النظامية هي التي تم تثبيتها من ملفات APK
  //       return !app.systemApp;
  //     }
  //     return false;
  //   }).cast<ApplicationWithIcon>().toList();

  //   setState(() {
  //     _apps = apkApps;
  //   });
  // }


  void _uninstallApp(String packageName) async {
    setState(() {
      _apps = _apps?.where((app) => app.packageName != packageName).toList();
    });

    bool uninstalled = await DeviceApps.uninstallApp(packageName);
    if (uninstalled) {
      _fetchApps();
    } else {
      _fetchApps();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_apps == null) {
      return Stack(
        children: [
          const BackgroundWidget(),
           Center(child: Lottie.asset('assets/images/lodaing.json')),

        ],
      );

      //   Container(
      //   width: double.maxFinite.w,
      //   height: double.maxFinite.h,
      //   color: Colors.transparent,
      // );
    } else {
      return Scaffold(
        body: Stack(
          children: [
            const BackgroundWidget(),
            const CustomAppBar3(),
            const CustomDivider(),
            Positioned(
              top: 110,
              left: 0,
              right: 0,
              child: _apps == null
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      color: Colors.transparent,
                      height: 600,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _apps!.length,
                        itemBuilder: (context, index) {
                          Application app = _apps![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: 80.h,
                              decoration: BoxDecoration(
                                // color: mb,
                                gradient: const LinearGradient(
                                  colors: [bg5, bg6],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading: app is ApplicationWithIcon
                                    ? Image.memory(app.icon)
                                    : null,
                                title: SubTitle(
                                    text: app.appName,
                                    size: 12,
                                    color: whiteColor,
                                    weight: FontWeight.w600),
                                // Text(app.appName),
                                subtitle: SubTitle(
                                    text: app.packageName,
                                    size: 10,
                                    color: textTitleColor,
                                    weight: FontWeight.w600),
                                //  Text(app.packageName),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.delete_forever,
                                    color: whiteColor,
                                  ),
                                  onPressed: () {
                                    _uninstallApp(app.packageName);
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      );
    }
  }
}