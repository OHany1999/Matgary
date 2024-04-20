import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/routes/routes.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/login/presentation/screens/login_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

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
      ),
    );
  }
}

