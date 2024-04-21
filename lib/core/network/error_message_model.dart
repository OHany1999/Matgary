import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{

  final bool status;
  final String message;
  final dynamic data;


  const ErrorMessageModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        status: json['status'],
        message: json['message'],
        data: json['data'],

      );

  @override
  // TODO: implement props
  List<Object?> get props => [status, message,];

}
