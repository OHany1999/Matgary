import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/presentation/controller/add_or_remove_cart_bloc/add_or_remove_cart_state.dart';
import 'package:matgary/core/global/shared_widgets/error_widget.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/global/toast/toast.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/favorite/domain/entities/favorite_list_entity.dart';
import 'package:matgary/favorite/presentation/controller/delete_favorite_bloc/delete_favorite_bloc.dart';
import 'package:matgary/favorite/presentation/controller/delete_favorite_bloc/delete_favorite_state.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_bloc.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_event.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_state.dart';
import 'package:matgary/favorite/presentation/controller/remove_local_list_bloc/remove_local_list_bloc.dart';
import 'package:matgary/favorite/presentation/controller/remove_local_list_bloc/remove_local_list_state.dart';
import 'package:matgary/favorite/presentation/screens/widgets/favorite_list_card.dart';
import 'package:matgary/home/domain/entities/home_entity.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_event.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_state.dart';
import 'package:matgary/product_details/presentation/controller/add_and_remove_favorite_bloc/add_and_remove_favorite_bloc.dart';
import 'package:matgary/product_details/presentation/controller/add_and_remove_favorite_bloc/add_and_remove_favorite_state.dart';
import 'package:matgary/product_details/presentation/screens/product_details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite';

  FavoriteScreen({super.key});

  List<ProductsEntity>? localDataEntityList = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeBloc>()..add(const GetHomeEvent())),
        BlocProvider(create: (context) => RemoveLocalListBloc()),
        BlocProvider(create: (context) => sl<AddAndRemoveFavoriteBloc>()),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeListState) {
          switch (homeListState.requestState) {
            case RequestState.initial:
              return const Center(child: Text('initial'));
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.success:
              final favList = homeListState.homeEntity!.data!.products!.where((element) => element.inFavorites == true).toList();
              localDataEntityList = favList;
              return RefreshIndicator(
                color: AppColorsLight.orangeColor3,
                onRefresh: () {
                  context.read<HomeBloc>().add(const GetHomeEvent());
                  return Future(() => null);
                },
                child: CustomScrollView(
                  slivers: [
                    BlocConsumer<AddAndRemoveFavoriteBloc,AddFavoriteState>(
                      builder: (context, state) => SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: localDataEntityList!.length,
                                  (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        ProductDetailsScreen.routeName,
                                        arguments: localDataEntityList![index]);
                                  },
                                  child:FavoriteListCard(
                                    localDataEntityList: localDataEntityList,
                                    index: index,
                                  ),
                                );
                              },
                            ),
                          ),
                      listener: (context,state){
                        switch(state.addFavoriteRequestState){
                          case AddFavoriteRequestState.initial:
                            print('intial state r');
                          case AddFavoriteRequestState.loading:
                            print('loading state r');
                          case AddFavoriteRequestState.success:
                            ToastMessages.showToast(message: state.addFavoriteEntity!.message!,);
                          case AddFavoriteRequestState.error:
                            ToastMessages.showToast(message: 'هناك خطأ في الاتصال',backGroundColor: Colors.redAccent);
                        }
                      },
                    ),


                  ],
                ),
              );
            case RequestState.error:
              return ErrorWidgetWithReload(
                onPress: () {
                  context.read()<HomeBloc>().add(const GetHomeEvent());
                },
              );
          }
        },
      ),
    );
  }
}


