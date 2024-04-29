import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_event.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_state.dart';
import 'package:matgary/home/presentation/screens/home_screen/banners_widget.dart';
import 'package:matgary/home/presentation/screens/home_screen/product_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(sl())..add(const GetHomeEvent()),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) {
          print('previous state${previous.requestState}');
          print('current state${current.requestState}');
          if (previous.requestState != current.requestState) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.initial:
              return const Center(
                child: Text('initial'),
              );
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.success:
              var productList = state.homeEntity!.data!.products;
              var bannertList = state.homeEntity!.data!.banners;
              return Scaffold(
                body: RefreshIndicator(
                  onRefresh: () {
                    context.read<HomeBloc>().add(const GetHomeEvent());
                    return Future(() => null);
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 50,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                         BannersWidget(myList: bannertList,),
                          SizedBox(
                            height: 30.h,
                          ),
                          ProductWidget(myList: productList),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            case RequestState.error:
              return  SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(const GetHomeEvent());
                      },
                      child: const Text('Reload'),
                    ),
                    const SizedBox(height: 6,),
                    const Text('There is error')
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

//  if (context.bloc<MyDataBloc>().state is MyDataLoaded)
