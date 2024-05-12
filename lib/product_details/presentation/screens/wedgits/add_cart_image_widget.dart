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
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      width: MediaQuery.of(context).size.width,
                      height: 340.h,
                      imageUrl: productDetailsEntity!.data!.image!,
                      placeholder: (context, url) => const Icon(
                        Icons.image,
                        size: 80,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.image,
                        size: 80,
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: -25,
                      child: BlocListener<AddAndRemoveFavoriteBloc,
                          AddFavoriteState>(
                        listener: (context, stateOfAddAndRemoveFavorite) {
                          switch (stateOfAddAndRemoveFavorite
                              .addFavoriteRequestState) {
                            case AddFavoriteRequestState.initial:
                              print('initial***');
                            case AddFavoriteRequestState.loading:
                              BlocProvider.of<FavoriteBloc>(context).add(
                                  FavoriteEvent(
                                      isFav: !stateOfFavorite.favorite));
                            case AddFavoriteRequestState.success:
                              ToastMessages.showToast(
                                  message: stateOfAddAndRemoveFavorite
                                      .addFavoriteEntity!.message!);
                              print(BlocProvider.of<AddAndRemoveFavoriteBloc>(
                                      context)
                                  .state
                                  .addFavoriteEntity);
                            case AddFavoriteRequestState.error:
                              print('error***');
                              BlocProvider.of<FavoriteBloc>(context).add(
                                  FavoriteEvent(
                                      isFav: !stateOfFavorite.favorite));
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
                    ),
                    Positioned(
                      left: 15,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          child: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${productDetailsEntity!.data!.price!.toString()} EGP',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 20),
                        ),
                        if (productDetailsEntity!.data!.discount != 0)
                          Text(
                            '${productDetailsEntity!.data!.oldPrice!} EGP',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 16,
                                  color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                                ),
                          ),
                      ],
                    ),
                    Container(
                      width: 200.w,
                      child: Text(
                        productDetailsEntity!.data!.name!,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

//const TextStyle(
//                             decoration: TextDecoration.lineThrough,
//                             color: Colors.red,
//                           ),
