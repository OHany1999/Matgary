import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/global/shared_widgets/elvated_bottom.dart';
import 'package:matgary/core/global/shared_widgets/textField.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/global/toast/toast.dart';
import 'package:matgary/core/services/services_locator.dart';

import 'package:matgary/home/presentation/screens/navbar_screen/navbar_screen.dart';
import 'package:matgary/login/presentation/controller/login_bloc.dart';
import 'package:matgary/register/presentation/controller/register_bloc/register_bloc.dart';
import 'package:matgary/register/presentation/controller/register_bloc/register_event.dart';
import 'package:matgary/register/presentation/controller/register_bloc/register_state.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const routeName = '/register';
  final AppPreferences _appPref = sl<AppPreferences>();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerRePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<RegisterBloc>()),
        BlocProvider(create: (context) => PasswordRegisterObsBloc()),
      ],
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                 SizedBox(height: 40.h),
                Center(
                  child: Text(
                    "انشاء حساب",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                 SizedBox(height: 10.h),
                Text(
                  'الاسم',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
                ),
                SizedBox(height: 10.h),
                GlobalTextField(
                  textEditingController: _controllerName,
                  keyboardType: TextInputType.name,
                  suffixIcon: null,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "يجب ادخال الاسم";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  'رقم الهاتف',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
                ),
                 SizedBox(height: 10.h),
                GlobalTextField(
                  textEditingController: _controllerPhone,
                  keyboardType: TextInputType.phone,
                  suffixIcon: null,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "يجب ادخال رقم الهاتف";
                    }
                    return null;
                  },
                ),
                 SizedBox(height: 10.h),
                Text(
                  'البريد الالكتروني',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
                ),
                 SizedBox(height: 10.h),
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
                 SizedBox(height: 10.h),
                Text(
                  'كلمة السر',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
                ),
                 SizedBox(height: 10.h),
                BlocBuilder<PasswordRegisterObsBloc, PasswordRegisterObscureState>(
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
                      context.read<PasswordRegisterObsBloc>().add('+');
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "يجب ادخال الباسورد";
                      }
                      return null;
                    },
                  ),
                ),
                 SizedBox(height: 10.h),
                Text(
                  'إعادة إدخال كلمة المرور',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
                ),
                SizedBox(height: 10.h),
                BlocBuilder<PasswordRegisterObsBloc, PasswordRegisterObscureState>(
                  builder: (context, state) => GlobalTextField(
                    textEditingController: _controllerRePassword,
                    focusNode: _focusNodePassword,
                    obscureText: state.obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: null,
                    addPrefixIcon: true,
                    addPrefixIconImage: state.obscurePassword
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                    addPrefixIconOnPress: () {
                      context.read<PasswordRegisterObsBloc>().add('+');
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "يجب اعادة ادخال كلمة المرور";
                      }else if(_controllerRePassword.text != _controllerPassword.text){
                        return "كلمة السر المعاد ادخالها غير متطابقة مع كلمة السر الاصلية";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: BlocConsumer<RegisterBloc, RegisterState>(
                    buildWhen: (previous, current) =>
                    previous.registerRequestState != current.registerRequestState,
                    listenWhen: (previous, current) =>
                    previous.registerRequestState != current.registerRequestState,
                    builder: (context, state) {
                      switch (state.registerRequestState) {
                        case RegisterRequestState.initial:
                          return GlobalElevatedButton(
                              bottomPadding: EdgeInsets.symmetric(vertical: 5.h),
                              fontSize: 22,
                              onPress: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  context.read<RegisterBloc>().add(GetRegisterEvent(name: _controllerName.text, phone: _controllerPhone.text, email: _controllerEmail.text, password: _controllerPassword.text));
                                }
                              });
                        case RegisterRequestState.loading:
                          return const CircularProgressIndicator(
                            color: AppColorsLight.orangeColor3,
                          );
                        case RegisterRequestState.success:
                          return GlobalElevatedButton(
                              bottomPadding: EdgeInsets.symmetric(vertical: 5.h),
                              fontSize: 22,
                              onPress: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  context.read<RegisterBloc>().add(GetRegisterEvent(name: _controllerName.text, phone: _controllerPhone.text, email: _controllerEmail.text, password: _controllerPassword.text));
                                }
                              });
                        case RegisterRequestState.error:
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
                                      context.read<RegisterBloc>().add(GetRegisterEvent(name: _controllerName.text, phone: _controllerPhone.text, email: _controllerEmail.text, password: _controllerPassword.text));
                                    }
                                  }),
                            ],
                          );
                      }
                    },
                    listener: (context, state) {
                      if (state.registerRequestState == RegisterRequestState.success) {
                        if (state.successEntity!.data != null) {
                          // _appPref.addToken(token: state.successEntity!.data!.token!);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            NavBarScreen.routeName,
                            arguments: state.successEntity,
                                (Route<dynamic> route) => false,
                          );
                        } else {
                          ToastMessages.showToast(
                              message: '${state.successEntity!.message}');
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
