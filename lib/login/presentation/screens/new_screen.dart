import 'package:flutter/material.dart';
import 'package:matgary/login/data/model/login_model.dart';

class NewScreen extends StatelessWidget {
  static const routeName = '/new';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as LoginModel;
    return Scaffold(
      body: Center(
        child: Text(args.data.email),
      ),
    );
  }
}
