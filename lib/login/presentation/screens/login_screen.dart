import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/login/presentation/controller/login_bloc.dart';
import 'package:matgary/login/presentation/controller/login_event.dart';
import 'package:matgary/login/presentation/controller/login_state.dart';
import 'package:matgary/login/presentation/screens/new_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login';

  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> PasswordObsBloc(),
      child: BlocBuilder<PasswordObsBloc,PasswordObscureState>(
        builder: (context,state)=>Scaffold(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primaryContainer,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  Text(
                    "Welcome back",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Login to your account",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                  const SizedBox(height: 60),
                  TextFormField(
                    controller: _controllerUsername,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onEditingComplete: () => _focusNodePassword.requestFocus(),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter username.";
                      } else if (value.isNotEmpty) {
                        return "Username is not registered.";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _controllerPassword,
                    focusNode: _focusNodePassword,
                    obscureText: state.obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                          onPressed: () {
                            context.read<PasswordObsBloc>().add('+');
                            print(bool);
                          },
                          icon: state.obscurePassword
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password.";
                      } else if (value.isNotEmpty) {
                        return "Wrong password.";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return Home();
                            //     },
                            //   ),
                            // );
                          }
                        },
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}


//import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:matgary/core/services/services_locator.dart';
// import 'package:matgary/core/utils/enum.dart';
// import 'package:matgary/login/presentation/controller/login_bloc.dart';
// import 'package:matgary/login/presentation/controller/login_event.dart';
// import 'package:matgary/login/presentation/controller/login_state.dart';
// import 'package:matgary/login/presentation/screens/new_screen.dart';
//
// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);
//
//   static const routeName = '/login';
//
//   String textEmail = '';
//   String textPassword = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<LoginBloc>(),
//       child: Scaffold(
//         body: Container(
//           color: Colors.red,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 color: Colors.green,
//                 child: Text('Log in'),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextField(
//                     onChanged: (value) {
//                       textEmail = value;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//                   TextField(
//                     onChanged: (value) {
//                       textPassword = value;
//                     },
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//                   BlocConsumer<LoginBloc, LoginState>(
//                     buildWhen: (previous, current) =>
//                         previous.requestState != current.requestState,
//                     listenWhen: (previous, current) =>
//                         previous.requestState != current.requestState,
//                     builder: (context, state) {
//                       print(state.hashCode);
//                       print(state.requestState);
//                       print(state.loginEntity);
//                       print(state.loginMessage);
//                       switch (state.requestState) {
//                         case RequestState.initial:
//                           return ElevatedButton(
//                             onPressed: () {
//                               context.read<LoginBloc>().add(GetLoginEvent(
//                                   email: 'omar1999@gmail.com',
//                                   password: '123456'));
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 40, vertical: 15)),
//                             child: Text(
//                               "Login",
//                               style: TextStyle(
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           );
//                         case RequestState.loading:
//                           return CircularProgressIndicator();
//                         case RequestState.success:
//                           return ElevatedButton(
//                             onPressed: () {
//                               context.read<LoginBloc>().add(GetLoginEvent(
//                                   email: 'omar1999@gmail.com',
//                                   password: '123456'));
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 40.w, vertical: 15.h)),
//                             child: Text(
//                               "Login",
//                               style: TextStyle(
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           );
//                         case RequestState.error:
//                           return Text('${state.loginMessage}');
//                       }
//                     },
//                     listener: (context, state) {
//                       if (state.requestState == RequestState.success) {
//                         Navigator.pushNamed(context, NewScreen.routeName,
//                             arguments: state.loginEntity);
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
