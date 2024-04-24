import 'package:flutter/material.dart';
import 'package:matgary/home/presentation/screens/category_screen.dart';
import 'package:matgary/home/presentation/screens/favorite_screen.dart';
import 'package:matgary/home/presentation/screens/home_screen.dart';
import 'package:matgary/home/presentation/screens/my_navbar_screen.dart';
import 'package:matgary/login/presentation/screens/login_screen.dart';


Map<String, Widget Function(BuildContext)> myRoutes(){
  return {
    LoginScreen.routeName: (context)=> LoginScreen(),
    MyNavBarScreen.routeName:(context)=> MyNavBarScreen(),
    HomeScreen.routeName:(context)=> HomeScreen(),
    CategoryScreen.routeName:(context)=> CategoryScreen(),
    FavoriteScreen.routeName:(context)=> FavoriteScreen(),
  };

}

String myInitialRoute(){
  return MyNavBarScreen.routeName;
}