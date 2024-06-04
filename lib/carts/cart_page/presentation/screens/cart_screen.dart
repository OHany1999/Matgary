import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cartScreen';
  const CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text('العربة',style: Theme.of(context).textTheme.headlineLarge,),
      ),
    );
  }
}
