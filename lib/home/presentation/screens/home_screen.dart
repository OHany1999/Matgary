import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('rebuilllllllllllllllllllllllllllllllld hoooooome');
    return Center(
      child: Text('Home'),
    );
  }
}
