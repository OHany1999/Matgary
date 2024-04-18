import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/login/presentation/controller/login_bloc.dart';
import 'package:matgary/login/presentation/controller/login_event.dart';
import 'package:matgary/login/presentation/controller/login_state.dart';
import 'package:matgary/login/presentation/screens/new_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  String textEmail = '';
  String textPassword = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<LoginBloc>(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Login Screen'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    textEmail = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) {
                    textPassword = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 16),
                // BlocBuilder<LoginBloc, LoginState>(
                //   builder: (context, state) {
                //     print(state.requestState);
                //     print(state.loginEntity);
                //     print(state.loginMessage);
                //
                //     switch (state.requestState){
                //       case RequestState.initial:
                //         return ElevatedButton(
                //           onPressed: () {
                //             context.read<LoginBloc>().add(GetLoginEvent(
                //                 email: 'omar1999@gmail.com', password: '123456'));
                //           },
                //           style: ElevatedButton.styleFrom(
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(10)),
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 40, vertical: 15)),
                //           child: const Text(
                //             "Login",
                //             style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         );
                //       case RequestState.loading:
                //         return CircularProgressIndicator();
                //       case RequestState.success:
                //         return ElevatedButton(
                //           onPressed: () {
                //             context.read<LoginBloc>().add(GetLoginEvent(
                //                 email: 'omar1999@gmail.com', password: '123456'));
                //           },
                //           style: ElevatedButton.styleFrom(
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(10)),
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 40, vertical: 15)),
                //           child: const Text(
                //             "Login",
                //             style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         );
                //       case RequestState.error:
                //         return Text('${state.loginMessage}');
                //     }
                //
                //   },
                // ),
                BlocConsumer<LoginBloc, LoginState>(
                    builder: (context,state){
                      print(state.requestState);
                      print(state.loginEntity);
                      print(state.loginMessage);

                      switch (state.requestState){
                        case RequestState.initial:
                          return ElevatedButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(GetLoginEvent(
                                  email: 'omar1999@gmail.com', password: '123456'));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15)),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        case RequestState.loading:
                          return CircularProgressIndicator();
                        case RequestState.success:
                          return ElevatedButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(GetLoginEvent(
                                  email: 'omar1999@gmail.com', password: '123456'));
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15)),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        case RequestState.error:
                          return Text('${state.loginMessage}');
                      }

                    },
                    listener: (context,state){
                      if(state.requestState == RequestState.success){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewScreen(email: state.loginEntity!.data.email,)));
                      }
                    },
                ),
              ],
            ),
          ),
        ),
    );
  }
}


//class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);
//   String textEmail = '';
//   String textPassword = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginBloc(sl()),
//       child: BlocBuilder<LoginBloc, LoginState>(
//         builder: (context, state) {
//           print(state.requestState);
//           print(state.loginEntity);
//           print(state.loginMessage);
//           if(state.requestState == RequestState.success){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>NewScreen()));
//           }else{}
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Login Screen'),
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextField(
//                     onChanged: (value) {
//                       textEmail = value;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextField(
//                     onChanged: (value) {
//                       textPassword = value;
//                     },
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                         context.read<LoginBloc>().add(GetLoginEvent(email: 'omar1999@gmail.com', password: '123456'));
//                         print(state.requestState);
//                         print(state.loginEntity);
//                         print(state.loginMessage);
//
//                     },
//                     style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 40, vertical: 15)),
//                     child: const Text(
//                       "Login",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }