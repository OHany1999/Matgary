import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/global/routes/routes.dart';
import 'package:matgary/core/global/theme/theme_data/theme_data_light.dart';
import 'package:matgary/core/services/services_locator.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator().init();
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
        title: 'Matgary',
        routes: myRoutes(),
        initialRoute: myInitialRoute(),
        theme: getThemeDataLight(),
      ),
    );
  }
}

