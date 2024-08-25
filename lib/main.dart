import 'package:correctsoc/config/app_localizations.dart';
import 'package:correctsoc/config/bloc_observer.dart';
import 'package:correctsoc/core/cache_helper/dio_helper.dart';
import 'package:correctsoc/core/utils/app_colors.dart';
import 'package:correctsoc/features/data/shared/local_network.dart';
import 'package:correctsoc/features/layout/Localization/cubit/local_cubit.dart';
import 'package:correctsoc/features/presentation/screens/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cacheInitialization();
  // token = await CacheNetwork.getCacheData(key: 'token');
  DioHelper.init();
  Bloc.observer = AppBlocObserver();
  
 

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  
   const MyApp({super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LocalCubit()..getSavedLanguage(),
        ),
        
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocBuilder<LocalCubit, LocalState>(
          builder: (context, state) {
            if (state is ChangeLocaleState) {
              return MaterialApp(
                locale: state.locale,
                supportedLocales: const [Locale('ar'),Locale('en')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                debugShowCheckedModeBanner: false,
                title: 'Correctsoc',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home:   const SplashView(),
              );
            }
            return Container(
              color: whiteColor,
            );
          },
        ),
      ),
    );
  }
}

