import 'package:equatable/equatable.dart';

enum ConnectionStateTypes{
  initial,
  isConnected,
  isNotConnected,
}

class CheckConnectionState extends Equatable {
  final ConnectionStateTypes isConnected;



  const CheckConnectionState({this.isConnected = ConnectionStateTypes.initial});


  @override
  // TODO: implement props
  List<Object?> get props => [];
}




