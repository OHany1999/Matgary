import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/toast/toast.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/shared_widgets/textField.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => PasswordObsBloc()),
      ],
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),
                Center(
                  child: Text(
                    "Log in",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: 100),
                Text('E-mail',style: Theme.of(context).textTheme.bodyMedium,),
                const SizedBox(height: 10),
                GlobalTextField(
                  textEditingController: _controllerUsername,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.person_outline),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  validator:  (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter username.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Text('Password',style: Theme.of(context).textTheme.bodyMedium,),
                const SizedBox(height: 10),
                BlocBuilder<PasswordObsBloc, PasswordObscureState>(
                  builder: (context, state) => GlobalTextField(
                    textEditingController: _controllerPassword,
                    focusNode: _focusNodePassword,
                    obscureText: state.obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.password_outlined),
                    addSuffixIcon: true,
                    suffixIconImage: state.obscurePassword
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                    suffixIconOnPress: () {
                      context.read<PasswordObsBloc>().add('+');
                    },
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password.";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 60),
                Center(
                  child: BlocConsumer<LoginBloc, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.requestState != current.requestState,
                    listenWhen: (previous, current) =>
                        previous.requestState != current.requestState,
                    builder: (context, state) {
                      print(state.hashCode);
                      print(state.requestState);
                      print(state.loginEntity);
                      print(state.loginMessage);
                      switch (state.requestState) {
                        case RequestState.initial:
                          return ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context.read<LoginBloc>().add(GetLoginEvent(
                                    email: _controllerUsername.text,
                                    password: _controllerPassword.text));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15)),
                            child: Text(
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
                              if (_formKey.currentState?.validate() ?? false) {
                                context.read<LoginBloc>().add(GetLoginEvent(
                                    email: _controllerUsername.text,
                                    password: _controllerPassword.text));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.w, vertical: 15.h)),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        case RequestState.error:
                          return Text('there is error');
                      }
                    },
                    listener: (context, state) {
                      if (state.requestState == RequestState.success) {
                        if (state.loginEntity!.data != null) {
                          Navigator.pushNamed(context, NewScreen.routeName,
                              arguments: state.loginEntity);
                        } else {
                          ToastMessages.showToast(
                              message: 'Wrong Email or Password');
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
