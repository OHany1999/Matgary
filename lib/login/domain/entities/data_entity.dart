import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  const Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,email,phone,image,points,credit,token];
}
