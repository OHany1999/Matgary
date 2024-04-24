import 'package:flutter/material.dart';
import 'package:matgary/home/presentation/screens/home_screen.dart';
import 'package:matgary/login/presentation/screens/login_screen.dart';


Map<String, Widget Function(BuildContext)> myRoutes(){
  return {
    LoginScreen.routeName: (context)=> LoginScreen(),
    HomeScreen.routeName:(context)=> HomeScreen(),
  };

}

String myInitialRoute(){
  return HomeScreen.routeName;
}