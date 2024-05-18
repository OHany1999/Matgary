import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/global/shared_widgets/error_widget.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_bloc.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_event.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_state.dart';
import 'package:matgary/favorite/presentation/screens/widgets/favorite_list_card.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite';

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                sl<FavoriteListBloc>()..add(GetFavoriteListEvent())),
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
              return RefreshIndicator(
                color: AppColorsLight.orangeColor3,
                onRefresh: () {
                  context.read<FavoriteListBloc>().add(GetFavoriteListEvent());
                  return Future(() => null);
                },
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: favList!.length,
                        (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: FavoriteListCard(favList: favList,index: index,),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            case FavoriteListRequestState.error:
              return ErrorWidgetWithReload(onPress: (){
                context.read<FavoriteListBloc>().add(GetFavoriteListEvent());
              },);
          }
        },
      ),
    );
  }
}


