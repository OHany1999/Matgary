import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/global/shared_widgets/error_widget.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/home/domain/entities/home_entity.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_event.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_state.dart';
import 'package:matgary/home/presentation/controller/slider_indicator_bloc/slider_indicator_bloc.dart';
import 'package:matgary/home/presentation/screens/home_screen/widgets/banners_widget.dart';
import 'package:matgary/home/presentation/screens/home_screen/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  HomeScreen({super.key});

  List<ProductsEntity>? productListtt = [];
  List<BannersEntity>? bannertListtt = [];

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
        buildWhen: (previous, current) =>
        previous.requestState != current.requestState,
        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.initial:
              return const SizedBox();
            case RequestState.loading:
              if (productListtt!.isNotEmpty && bannertListtt!.isNotEmpty) {
                return CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    const SliverToBoxAdapter(child: LinearProgressIndicator(),),
                    SliverToBoxAdapter(
                      child: BannersWidget(
                        myList: bannertListtt,
                      ),
                    ),
                    ProductWidget(myList: productListtt),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

            case RequestState.success:
              var bannerList = state.homeEntity!.data!.banners;
              var productList = state.homeEntity!.data!.products;
              productListtt = productList;
              bannertListtt = bannerList;
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
                            myList: bannertListtt,
                          ),
                        ),
                        ProductWidget(myList: productListtt),
                      ],
                    ),
                  ),
                ),
              );
            case RequestState.error:
              return ErrorWidgetWithReload(onPress: (){context.read<HomeBloc>().add(const GetHomeEvent());});
          }
        },
      ),
    );
  }
}

