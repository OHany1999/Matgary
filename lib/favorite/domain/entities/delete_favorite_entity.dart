import 'package:equatable/equatable.dart';

class DeleteFavoriteEntity extends Equatable{
  final bool? status;
  final String? message;

  const DeleteFavoriteEntity({required this.status, required this.message});


  @override
  // TODO: implement props
  List<Object?> get props => [status,message];

}