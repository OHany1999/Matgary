import 'package:flutter/material.dart';


class CategoryScreen extends StatefulWidget {
  static const routeName = '/category';

  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String data = 'not pressed';


  @override
  Widget build(BuildContext context) {
    print('rebuilllllllllllllllllllllllllllllllld catt');
    return Center(
      child: Column(
        children: [
          Text('Category'),
          ElevatedButton(
            onPressed: () {
              data = 'pressed';
              setState(() {

              });
            },
            child: Text(data),
          ),
        ],
      ),
    );
  }

}
