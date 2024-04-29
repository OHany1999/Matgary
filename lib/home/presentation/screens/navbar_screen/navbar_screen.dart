import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/home/presentation/controller/nav_bar_bloc/nav_bar_bloc.dart';
import 'package:matgary/home/presentation/controller/nav_bar_bloc/nav_bar_event.dart';
import 'package:matgary/home/presentation/controller/nav_bar_bloc/nav_bar_state.dart';
import 'package:matgary/home/presentation/screens/category_screen/category_screen.dart';
import 'package:matgary/home/presentation/screens/favorite_screen/favorite_screen.dart';
import 'package:matgary/home/presentation/screens/home_screen/home_screen.dart';

class NavBarScreen extends StatelessWidget {
  static const routeName = '/navBar';

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
            body: homeWidget.elementAt(state.selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: AppColorsLight.orangeColor3,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'favorite',
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
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
  ];
}

// package
//for keep alive
// body: LazyLoadIndexedStack(
// index: state.selectedIndex,
// children: homeWidget,
// ),