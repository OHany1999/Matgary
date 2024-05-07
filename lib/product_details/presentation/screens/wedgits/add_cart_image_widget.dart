import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/product_details/domain/entities/home_details_entity.dart';
import 'package:matgary/product_details/presentation/controller/favorite_bloc/favorite_bloc.dart';
import 'package:matgary/product_details/presentation/controller/favorite_bloc/favorite_event.dart';
import 'package:matgary/product_details/presentation/controller/favorite_bloc/favorite_state.dart';

class AddCartImageWidget extends StatelessWidget {
  ProductDetailsEntity? productDetailsEntity;

  AddCartImageWidget({super.key, required this.productDetailsEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc()
        ..add(FavoriteEvent(isFav: productDetailsEntity!.data!.inFavorites!)),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          print(' fav state ${state.favorite}');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.network(
                productDetailsEntity!.data!.image!,
                width: MediaQuery.of(context).size.width,
                height: 340.h,
              ),
              Container(
                margin: const EdgeInsets.only(right: 30),
                child: IconButton(
                  icon: state.favorite == false
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
                    BlocProvider.of<FavoriteBloc>(context)
                        .add(FavoriteEvent(isFav: !state.favorite));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
