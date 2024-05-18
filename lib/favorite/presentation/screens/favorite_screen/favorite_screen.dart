import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_bloc.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_event.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_state.dart';

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
      child: BlocBuilder<FavoriteListBloc,FavoriteListState>(
        builder: (context,favoriteListState){
          switch(favoriteListState.favoriteListRequestState){
            case FavoriteListRequestState.initial:
              return const Center(child: Text('initial'));
            case FavoriteListRequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case FavoriteListRequestState.success:
             return Center(child: Text(favoriteListState.favoriteListEntity!.data!.total.toString()));
            case FavoriteListRequestState.error:
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ooops!',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 150,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorsLight.orangeColor3,
                      ),
                      onPressed: () {
                        context.read<FavoriteListBloc>().add(GetFavoriteListEvent());
                      },
                      child: Text(
                        'Reload',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
