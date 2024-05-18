import 'package:equatable/equatable.dart';

class RemoveLocalListState extends Equatable {
  final bool removeLocalState ;

  const RemoveLocalListState({this.removeLocalState = true});

  @override
  // TODO: implement props
  List<Object?> get props => [removeLocalState];
}


