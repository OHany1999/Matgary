import 'package:equatable/equatable.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/home/domain/entities/home_entity.dart';


class HomeState extends Equatable {
  final HomeEntity? homeEntity;
  final RequestState requestState;
  final String homeMessage;


  const HomeState({
    this.homeEntity,
    this.requestState = RequestState.initial,
    this.homeMessage = '',
  });


  HomeState copyWith({
    HomeEntity? homeEntity,
    RequestState? requestState,
    String? homeMessage,
  }) {
    return HomeState(
      homeEntity: homeEntity ?? this.homeEntity,
      requestState: requestState ?? this.requestState,
      homeMessage: homeMessage ?? this.homeMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [homeEntity, requestState, homeMessage];
}





