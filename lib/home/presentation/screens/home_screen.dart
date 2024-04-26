import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_event.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('rebuilllllllllllllllllllllllllllllllld hoooooome');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(sl())..add(const GetHomeEvent()),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.requestState != current.requestState,
        builder: (context, state) {
          print(state.requestState);
          print(state.homeMessage);
          switch (state.requestState) {
            case RequestState.initial:
              return Center(child: Text('initial'),);
            case RequestState.loading:
              return Center(child: CircularProgressIndicator(),);
            case RequestState.success:
              return Scaffold(
                body: Center(child: Text('${state.homeEntity!.status.toString()}')),
              );
            case RequestState.error:
              return Center(
                child: Text('error'),
              );
          }
        },
      ),
    );
  }
}
