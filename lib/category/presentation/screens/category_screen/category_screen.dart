import 'package:flutter/material.dart';


class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('rebuilllllllllllllllllllllllllllllllld catt');
    return  Center(
      child: Column(
        children: [
          Text('Category'),
          TextField(style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }

}
