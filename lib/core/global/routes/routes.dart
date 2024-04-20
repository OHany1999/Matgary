import 'package:flutter/material.dart';
import 'package:matgary/login/presentation/screens/login_screen.dart';
import 'package:matgary/login/presentation/screens/new_screen.dart';

Map<String, Widget Function(BuildContext)> myRoutes(){
  return {
    LoginScreen.routeName: (context)=> LoginScreen(),
    NewScreen.routeName: (context)=> NewScreen(),
  };

}

String myInitialRoute(){
  return LoginScreen.routeName;
}