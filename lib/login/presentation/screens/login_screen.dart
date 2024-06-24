import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/global/shared_widgets/elvated_bottom.dart';
import 'package:matgary/core/global/shared_widgets/textField.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/global/toast/toast.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/home/presentation/screens/navbar_screen/navbar_screen.dart';
import 'package:matgary/login/presentation/controller/login_bloc.dart';
import 'package:matgary/login/presentation/controller/login_event.dart';
import 'package:matgary/login/presentation/controller/login_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const routeName = '/login';
  final AppPreferences _appPref = sl<AppPreferences>();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerEmail = TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 150),
                Center(
                  child: Text(
                    "تسجيل الدخول",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(height: 100),
                Text(
                  'البريد الالكتروني',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 10),
                GlobalTextField(
                  textEditingController: _controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: null,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "يجب ادخال البريد الالكتروني";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  'كلمة السر',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 10),
                BlocBuilder<PasswordObsBloc, PasswordObscureState>(
                  builder: (context, state) => GlobalTextField(
                    textEditingController: _controllerPassword,
                    focusNode: _focusNodePassword,
                    obscureText: state.obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: null,
                    addPrefixIcon: true,
                    addPrefixIconImage: state.obscurePassword
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                    addPrefixIconOnPress: () {
                      context.read<PasswordObsBloc>().add('+');
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "يجب ادخال الباسورد";
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
                      print(state.requestState);
                      switch (state.requestState) {
                        case RequestState.initial:
                          return GlobalElevatedButton(
                            bottomPadding: EdgeInsets.symmetric(vertical: 5.h),
                            fontSize: 22,
                              onPress: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<LoginBloc>().add(GetLoginEvent(
                                  email: _controllerEmail.text,
                                  password: _controllerPassword.text));
                            }
                          });
                        case RequestState.loading:
                          return const CircularProgressIndicator(
                            color: AppColorsLight.orangeColor3,
                          );
                        case RequestState.success:
                          return GlobalElevatedButton(
                              bottomPadding: EdgeInsets.symmetric(vertical: 5.h),
                              fontSize: 22,
                              onPress: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<LoginBloc>().add(GetLoginEvent(
                                  email: _controllerEmail.text,
                                  password: _controllerPassword.text));
                            }
                          });
                        case RequestState.error:
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GlobalElevatedButton(
                                  bottomPadding: EdgeInsets.symmetric(vertical: 5.h),
                                  fontSize: 22,
                                  onPress: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  context.read<LoginBloc>().add(GetLoginEvent(
                                      email: _controllerEmail.text,
                                      password: _controllerPassword.text));
                                }
                              }),
                            ],
                          );
                      }
                    },
                    listener: (context, state) {
                      if (state.requestState == RequestState.success) {
                        if (state.loginEntity!.data != null) {
                          _appPref.addToken(
                              token: state.loginEntity!.data!.token!);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            NavBarScreen.routeName,
                            arguments: state.loginEntity,
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          ToastMessages.showToast(
                              message: 'هناك خطأ في البريد الالكتروني او كلمة السر');
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
