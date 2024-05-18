import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/global/shared_widgets/error_widget.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/favorite/domain/entities/favorite_list_entity.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_bloc.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_event.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_state.dart';
import 'package:matgary/favorite/presentation/controller/remove_local_list_bloc/remove_local_list_bloc.dart';
import 'package:matgary/favorite/presentation/controller/remove_local_list_bloc/remove_local_list_state.dart';
import 'package:matgary/favorite/presentation/screens/widgets/favorite_list_card.dart';
import 'package:matgary/product_details/presentation/screens/product_details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite';

  FavoriteScreen({super.key});

  List<DataEntity>? localDataEntityList = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                sl<FavoriteListBloc>()..add(GetFavoriteListEvent())),
        BlocProvider(create: (context) => RemoveLocalListBloc()),
      ],
      child: BlocBuilder<FavoriteListBloc, FavoriteListState>(
        builder: (context, favoriteListState) {
          switch (favoriteListState.favoriteListRequestState) {
            case FavoriteListRequestState.initial:
              return const Center(child: Text('initial'));
            case FavoriteListRequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case FavoriteListRequestState.success:
              final favList = favoriteListState.favoriteListEntity!.data!.data;
              localDataEntityList = favList;
              print('localDataLength : ${localDataEntityList!.length}');
              return RefreshIndicator(
                color: AppColorsLight.orangeColor3,
                onRefresh: () {
                  context.read<FavoriteListBloc>().add(GetFavoriteListEvent());
                  return Future(() => null);
                },
                child: CustomScrollView(
                  slivers: [
                    BlocBuilder<RemoveLocalListBloc, RemoveLocalListState>(
                      builder: (context, state) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: localDataEntityList!.length,
                            (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProductDetailsScreen.routeName,
                                      arguments:
                                          localDataEntityList![index].product);
                                },
                                child: FavoriteListCard(
                                  localDataEntityList: localDataEntityList,
                                  index: index,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            case FavoriteListRequestState.error:
              return ErrorWidgetWithReload(
                onPress: () {
                  context.read<FavoriteListBloc>().add(GetFavoriteListEvent());
                },
              );
          }
        },
      ),
    );
  }
}
