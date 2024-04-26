import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  List<Object?> get props => [];
}

class GetHomeEvent extends HomeEvent {

  const GetHomeEvent();

  @override
  List<Object?> get props => [];
}



