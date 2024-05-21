import 'package:flutter/material.dart';


class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('rebuilllllllllllllllllllllllllllllllld catt');
    return   Center(
      child: Text('قريبا',style: Theme.of(context).textTheme.headlineLarge,),
    );
  }

}
