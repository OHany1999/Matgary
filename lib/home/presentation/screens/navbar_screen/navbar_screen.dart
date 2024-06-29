import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/carts/cart_page/presentation/screens/cart_screen.dart';
import 'package:matgary/category/presentation/screens/category_screen/category_screen.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/global/shared_widgets/show_dialog.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/favorite/presentation/screens/favorite_screen/favorite_screen.dart';
import 'package:matgary/home/presentation/controller/nav_bar_bloc/nav_bar_bloc.dart';
import 'package:matgary/home/presentation/controller/nav_bar_bloc/nav_bar_event.dart';
import 'package:matgary/home/presentation/controller/nav_bar_bloc/nav_bar_state.dart';

import 'package:matgary/home/presentation/screens/home_screen/home_screen.dart';
import 'package:matgary/login/presentation/screens/login_screen.dart';

class NavBarScreen extends StatelessWidget {
  static const routeName = '/navBar';
  final AppPreferences _appPref = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationBloc()),
      ],
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return Scaffold(
            // package
            appBar: AppBar(
              leading: Container(
                margin: const EdgeInsets.only(left: 15),
                child: IconButton(
                  iconSize: 30,
                    onPressed: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.add_shopping_cart,
                    )),
              ),
              actions: [
                IconButton(
                    iconSize: 30,
                    onPressed: () {
                      GlobalShowDialog global = GlobalShowDialog(
                        titleText: 'تسجيل الخروج',
                        questionText: 'هل تريد تأكيد تسجيل الخروج ؟',
                        onPressForAccept: (){
                          _appPref.clearToken();
                          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (Route<dynamic> route) => false,);
                        },
                        onPressForRefuse: (){
                          Navigator.pop(context);
                        },
                      );
                      global.globalShowDialog(context);

                    },
                    icon: const Icon(
                      Icons.logout,
                    )),
              ],
            ),
            body: homeWidget.elementAt(state.selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: AppColorsLight.orangeColor3,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, size: 30),
                  label: 'المفضلة',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 30),
                  label: 'الرئيسية',
                ),
              ],
              currentIndex: state.selectedIndex,
              onTap: (index) {
                BlocProvider.of<BottomNavigationBloc>(context)
                    .add(TabChangeEvent(tabIndex: index));
              },
            ),
          );
        },
      ),
    );
  }

  List<Widget> homeWidget = [
    FavoriteScreen(),
    HomeScreen(),
  ];
}

// package
//for keep alive
// body: LazyLoadIndexedStack(
// index: state.selectedIndex,
// children: homeWidget,
// ),
