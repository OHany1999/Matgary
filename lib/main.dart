import 'package:flutter/material.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/login/presentation/screens/login_screen.dart';

void main() {
  ServicesLocator().init();
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
      home: LoginScreen(),
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