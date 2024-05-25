import 'package:equatable/equatable.dart';

class AddOrRemoveCartEntity extends Equatable{
  final bool? status;
  final String? message;

  const AddOrRemoveCartEntity({required this.status,required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [status,message];

}