import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/usecase/base_usecase.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/home/domain/usecase/get_home_usecase.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_event.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeUseCase getHomeUseCase;

  HomeBloc(this.getHomeUseCase) : super(const HomeState()) {
    on<GetHomeEvent>(_getNowHome);
  }


  FutureOr<void> _getNowHome(GetHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await getHomeUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(homeMessage: l.message,requestState: RequestState.error)),
      (r) => emit(state.copyWith(homeEntity: r,requestState: RequestState.success)),
    );
  }
}
