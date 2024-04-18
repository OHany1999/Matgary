import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  final String email;
  const NewScreen({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(email),
      ),
    );
  }
}
