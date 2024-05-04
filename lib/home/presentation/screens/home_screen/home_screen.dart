import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_event.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_state.dart';
import 'package:matgary/home/presentation/controller/slider_indicator_bloc/slider_indicator_bloc.dart';
import 'package:matgary/home/presentation/screens/home_screen/widgets/banners_widget.dart';
import 'package:matgary/home/presentation/screens/home_screen/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>()..add(const GetHomeEvent()),
        ),
        BlocProvider(
          create: (context) => SliderIndicatorBloc(),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) {
          if (kDebugMode) {
            print('previous state${previous.requestState}');
          }
          if (kDebugMode) {
            print('current state${current.requestState}');
          }
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
              var bannertList = state.homeEntity!.data!.banners;
              var productList = state.homeEntity!.data!.products;
              return Scaffold(
                body: RefreshIndicator(
                  color: AppColorsLight.orangeColor3,
                  onRefresh: () {
                    context.read<HomeBloc>().add(const GetHomeEvent());
                    return Future(() => null);
                  },
                  child: SafeArea(
                    child: CustomScrollView(
                      scrollDirection: Axis.vertical,
                      slivers: [
                        SliverToBoxAdapter(
                          child: BannersWidget(
                            myList: bannertList,
                          ),
                        ),
                        ProductWidget(myList: productList),
                      ],
                    ),
                  ),
                ),
              );
            case RequestState.error:
              return SizedBox(
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
                    const SizedBox(
                      height: 6,
                    ),
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
