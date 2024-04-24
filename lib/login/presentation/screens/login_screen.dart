import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/global/check_connection_bloc/check_connection_bloc.dart';
import 'package:matgary/core/global/check_connection_bloc/check_connection_event.dart';
import 'package:matgary/core/global/check_connection_bloc/check_connection_state.dart';
import 'package:matgary/core/global/shared_widgets/elvated_bottom.dart';
import 'package:matgary/core/global/shared_widgets/textField.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/global/toast/toast.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/login/presentation/controller/login_bloc.dart';
import 'package:matgary/login/presentation/controller/login_event.dart';
import 'package:matgary/login/presentation/controller/login_state.dart';
import 'package:matgary/login/presentation/screens/new_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const routeName = '/login';
  final AppPreferences _appPref = sl<AppPreferences>();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                sl<CheckConnectionBloc>()..add(const CheckConnectionEvent())),
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => PasswordObsBloc()),
      ],
      child: BlocBuilder<CheckConnectionBloc, CheckConnectionState>(
        builder: (context, state) {
          switch (state.connectionStateTypes) {
            case ConnectionStateTypes.initial:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(color: AppColorsLight.orangeColor3,),
                ),
              );
            case ConnectionStateTypes.isConnected:
              return Scaffold(
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
                        Text(
                          'E-mail',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextField(
                          textEditingController: _controllerUsername,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: null,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter username.";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        BlocBuilder<PasswordObsBloc, PasswordObscureState>(
                          builder: (context, state) => GlobalTextField(
                            textEditingController: _controllerPassword,
                            focusNode: _focusNodePassword,
                            obscureText: state.obscurePassword,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: null,
                            addSuffixIcon: true,
                            suffixIconImage: state.obscurePassword
                                ? const Icon(Icons.visibility_outlined)
                                : const Icon(Icons.visibility_off_outlined),
                            suffixIconOnPress: () {
                              context.read<PasswordObsBloc>().add('+');
                            },
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
                                  return GlobalElevatedButton(onPress: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      context.read<LoginBloc>().add(
                                          GetLoginEvent(
                                              email: _controllerUsername.text,
                                              password:
                                                  _controllerPassword.text));
                                    }
                                  });
                                case RequestState.loading:
                                  return const CircularProgressIndicator(color: AppColorsLight.orangeColor3,);
                                case RequestState.success:
                                  return GlobalElevatedButton(onPress: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      context.read<LoginBloc>().add(
                                          GetLoginEvent(
                                              email: _controllerUsername.text,
                                              password:
                                                  _controllerPassword.text));
                                    }
                                  });
                                case RequestState.error:
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GlobalElevatedButton(onPress: () {
                                        if (_formKey.currentState?.validate() ??
                                            false) {
                                          context.read<LoginBloc>().add(
                                              GetLoginEvent(
                                                  email:
                                                      _controllerUsername.text,
                                                  password: _controllerPassword
                                                      .text));
                                        }
                                      }),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        state.loginMessage,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  );
                              }
                            },
                            listener: (context, state) {
                              if (state.requestState == RequestState.success) {
                                if (state.loginEntity!.data != null) {
                                  _appPref.addToken(
                                      token: state.loginEntity!.data!.token!);
                                  Navigator.pushNamed(
                                      context, NewScreen.routeName,
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
              );
            case ConnectionStateTypes.isNotConnected:
              return Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () =>
                            BlocProvider.of<CheckConnectionBloc>(context)
                                .add(const CheckConnectionEvent()),
                        child: const Text('reload')),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Check your network',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
