import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/global/routes/routes.dart';
import 'package:matgary/core/global/theme/theme_data/theme_data_light.dart';
import 'package:matgary/core/services/services_locator.dart';


void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ServicesLocator().init();
  final AppPreferences appPref = sl<AppPreferences>();
  print('token = ${appPref.getToken()}');
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}


GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(360, 690),
      child: MaterialApp(
        title: 'متجري',
        debugShowCheckedModeBanner: false,
        routes: myRoutes(),
        initialRoute: myInitialRoute(),
        theme: getThemeDataLight(),
      ),
    );
  }
}

