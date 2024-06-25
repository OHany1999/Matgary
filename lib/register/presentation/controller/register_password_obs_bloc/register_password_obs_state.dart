import 'package:equatable/equatable.dart';

class PasswordRegisterObscureState extends Equatable {
  final bool obscurePassword ;


  const PasswordRegisterObscureState({this.obscurePassword = true});


  @override
  // TODO: implement props
  List<Object?> get props => [obscurePassword];
}
///////////////////////////////////////////////////////////
class PasswordReAddRegisterObscureState extends Equatable {
  final bool reAddObscurePassword ;


  const PasswordReAddRegisterObscureState({this.reAddObscurePassword = true});


  @override
  // TODO: implement props
  List<Object?> get props => [reAddObscurePassword];
}