
import 'package:flutter/material.dart';
import 'package:matgary/carts/cart_page/presentation/screens/cart_screen.dart';
import 'package:matgary/category/presentation/screens/category_screen/category_screen.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/favorite/presentation/screens/favorite_screen/favorite_screen.dart';
import 'package:matgary/home/presentation/screens/home_screen/home_screen.dart';
import 'package:matgary/home/presentation/screens/navbar_screen/navbar_screen.dart';

import 'package:matgary/login/presentation/screens/login_screen.dart';
import 'package:matgary/product_details/presentation/screens/product_details_screen.dart';

final AppPreferences _appPref = sl<AppPreferences>();

Map<String, Widget Function(BuildContext)> myRoutes(){
  return {
    LoginScreen.routeName: (context)=> LoginScreen(),
    NavBarScreen.routeName:(context)=> NavBarScreen(),
    HomeScreen.routeName:(context)=> HomeScreen(),
    CategoryScreen.routeName:(context)=> const CategoryScreen(),
    FavoriteScreen.routeName:(context)=> FavoriteScreen(),
    ProductDetailsScreen.routeName:(context)=> const ProductDetailsScreen(),
    CartScreen.routeName:(context)=> const CartScreen(),
  };

}

String myInitialRoute(){
  if(_appPref.getToken() == null){
    return LoginScreen.routeName;
  }else{
    return NavBarScreen.routeName;
  }


}