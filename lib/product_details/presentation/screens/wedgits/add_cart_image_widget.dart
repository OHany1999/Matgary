import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/global/toast/toast.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/product_details/domain/entities/home_details_entity.dart';
import 'package:matgary/product_details/presentation/controller/add_and_remove_favorite_bloc/add_and_remove_favorite_bloc.dart';
import 'package:matgary/product_details/presentation/controller/add_and_remove_favorite_bloc/add_and_remove_favorite_event.dart';
import 'package:matgary/product_details/presentation/controller/add_and_remove_favorite_bloc/add_and_remove_favorite_state.dart';
import 'package:matgary/product_details/presentation/controller/favorite_bloc/favorite_bloc.dart';
import 'package:matgary/product_details/presentation/controller/favorite_bloc/favorite_event.dart';
import 'package:matgary/product_details/presentation/controller/favorite_bloc/favorite_state.dart';

class AddCartImageWidget extends StatelessWidget {
  ProductDetailsEntity? productDetailsEntity;

  AddCartImageWidget({super.key, required this.productDetailsEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AddAndRemoveFavoriteBloc>()),
        BlocProvider(
            create: (context) => FavoriteBloc()
              ..add(FavoriteEvent(
                  isFav: productDetailsEntity!.data!.inFavorites!))),
      ],
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, stateOfFavorite) {
          print(' fav state ${stateOfFavorite.favorite}');

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                height: 340.h,
                imageUrl: productDetailsEntity!.data!.image!,
                placeholder: (context, url) => Image.asset(
                  'assets/images/loading_image.jpg',
                  width: double.maxFinite.w,
                  height: double.maxFinite.h,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/loading_image.jpg',
                  width: double.maxFinite.w,
                  height: double.maxFinite.h,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(

                    margin: EdgeInsets.only(left: 15),
                    child: Container(
                      width: 200.w,
                      child: Text(
                        productDetailsEntity!.data!.name!,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 20.0),
                      ),
                    ),
                  ),
                  BlocListener<AddAndRemoveFavoriteBloc, AddFavoriteState>(
                    listener: (context, stateOfAddAndRemoveFavorite) {
                      switch (
                          stateOfAddAndRemoveFavorite.addFavoriteRequestState) {
                        case AddFavoriteRequestState.initial:
                          print('initial***');
                        case AddFavoriteRequestState.loading:
                          BlocProvider.of<FavoriteBloc>(context).add(
                              FavoriteEvent(isFav: !stateOfFavorite.favorite));
                        case AddFavoriteRequestState.success:
                          ToastMessages.showToast(
                              message: stateOfAddAndRemoveFavorite
                                  .addFavoriteEntity!.message!);
                          print(
                              BlocProvider.of<AddAndRemoveFavoriteBloc>(context)
                                  .state
                                  .addFavoriteEntity);
                        case AddFavoriteRequestState.error:
                          print('error***');
                          BlocProvider.of<FavoriteBloc>(context).add(
                              FavoriteEvent(isFav: !stateOfFavorite.favorite));
                          ToastMessages.showToast(
                              message: 'هناك خطأ في الاتصال',
                              backGroundColor: Colors.redAccent);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: IconButton(
                        icon: stateOfFavorite.favorite == false
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.grey,
                                size: 35,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: AppColorsLight.orangeColor3,
                                size: 35,
                              ),
                        onPressed: () {
                          BlocProvider.of<AddAndRemoveFavoriteBloc>(context)
                              .add(GetAddFavoriteEvent(
                                  id: productDetailsEntity!.data!.id));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
