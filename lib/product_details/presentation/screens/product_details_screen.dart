import 'package:flutter/material.dart';
import 'package:matgary/home/data/model/home_model.dart';
import 'package:matgary/product_details/domain/entities/home_details_entity.dart';

class ProductDetailsScreen extends StatelessWidget {


  const ProductDetailsScreen({super.key});

  static const routeName = '/product_details';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return Scaffold(
      body: Center(
        child: Text('${arg.id}'),
      ),
    );
  }
}
