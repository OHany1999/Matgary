import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/shared_widgets/elvated_bottom.dart';
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
                            onTap: () => null,
                            child: Card(
                              margin:
                                  EdgeInsets.only(top: 20, left: 10, right: 10),
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                side:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              child: SizedBox(
                                height: 220.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CachedNetworkImage(
                                      width: 120.w,
                                      height: 170.h,
                                      fit: BoxFit.fitHeight,
                                      imageUrl: favList[index].product!.image!,
                                      placeholder: (context, url) => const Icon(
                                        Icons.image,
                                        size: 80,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.image,
                                        size: 80,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.delete_forever,
                                            size: 35,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 200.w,
                                          margin: EdgeInsets.only(right: 10),
                                          child: Text(
                                            favList[index].product!.name!,
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(fontSize: 18.0),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${favList[index].product!.price.toString()} EGP',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(fontSize: 20),
                                              ),
                                              if (favList[index]
                                                      .product!
                                                      .discount !=
                                                  0)
                                                Text(
                                                  '${favList[index].product!.oldPrice!} EGP',
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontSize: 16,
                                                        color: Colors.red,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 20,top: 20),
                                          child: GlobalElevatedButton(
                                            bottomText: ' إلي عربة التسوق',
                                            onPress: () {},
                                            bottomSize: Size(150, 50),
                                            bottomPadding: EdgeInsets.symmetric(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
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
                          context
                              .read<FavoriteListBloc>()
                              .add(GetFavoriteListEvent());
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
