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

  String textEmail = '';
  String textPassword = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<LoginBloc>(),
        child: Scaffold(
          appBar: AppBar(
            title:  Text('Login Screen',style: Theme.of(context).textTheme.displayLarge,),
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
                SizedBox(height: 16.h),
                TextField(
                  onChanged: (value) {
                    textPassword = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 16.h),
                BlocConsumer<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => previous.requestState != current.requestState,
                    listenWhen: (previous, current) => previous.requestState != current.requestState,
                    builder: (context,state){
                    print(state.hashCode);
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
                            child:  Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20.sp,
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
                                padding:  EdgeInsets.symmetric(
                                    horizontal: 40.w, vertical: 15.h)),
                            child:  Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20.sp,
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
                        Navigator.pushNamed(context, NewScreen.routeName,arguments: state.loginEntity);
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

