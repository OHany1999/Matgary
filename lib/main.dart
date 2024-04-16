import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:matgary/core/network/api_constance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matgary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(body: Container(),),
    );
  }
}


//  Dio dio = Dio();
//   var response = await dio.post(
//     ApiConstance.loginPath,
//     data: {
//       "email": "omar1999@gmail.com",
//       "password": "123456"
//     },
//     queryParameters: {
//       'Content-Type':'application/json'
//     },
//   );
//   print(response.statusCode);
//   print(response.data.toString());