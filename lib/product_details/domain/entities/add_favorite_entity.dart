import 'package:equatable/equatable.dart';

class AddFavoriteEntity extends Equatable{
  final bool? status;
  final String? message;

  const AddFavoriteEntity({required this.status, required this.message});


  @override
  // TODO: implement props
  List<Object?> get props => [status,message];

}