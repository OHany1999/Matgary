import 'package:flutter/material.dart';
import 'package:matgary/home/presentation/screens/category_screen/category_screen.dart';
import 'package:matgary/home/presentation/screens/favorite_screen/favorite_screen.dart';
import 'package:matgary/home/presentation/screens/home_screen/home_screen.dart';
import 'package:matgary/home/presentation/screens/navbar_screen/navbar_screen.dart';

import 'package:matgary/login/presentation/screens/login_screen.dart';
import 'package:matgary/product_details/presentation/screens/product_details_screen.dart';


Map<String, Widget Function(BuildContext)> myRoutes(){
  return {
    LoginScreen.routeName: (context)=> LoginScreen(),
    NavBarScreen.routeName:(context)=> NavBarScreen(),
    HomeScreen.routeName:(context)=> HomeScreen(),
    CategoryScreen.routeName:(context)=> CategoryScreen(),
    FavoriteScreen.routeName:(context)=> FavoriteScreen(),
    ProductDetailsScreen.routeName:(context)=> ProductDetailsScreen(),
  };

}

String myInitialRoute(){
  return NavBarScreen.routeName;
}