import 'package:equatable/equatable.dart';

enum ConnectionStateTypes {
  initial,
  isConnected,
  isNotConnected,
}



class CheckConnectionState extends Equatable {

  final ConnectionStateTypes connectionStateTypes;

  const CheckConnectionState({
    this.connectionStateTypes = ConnectionStateTypes.initial,
  });

  CheckConnectionState copyWith({
    ConnectionStateTypes? connectionStateTypes,
}){
    return CheckConnectionState(
      connectionStateTypes: connectionStateTypes ?? this.connectionStateTypes,
    );
}



  @override
  // TODO: implement props
  List<Object?> get props => [connectionStateTypes];
}
