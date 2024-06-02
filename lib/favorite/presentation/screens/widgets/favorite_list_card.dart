import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/presentation/controller/add_or_remove_cart_bloc/add_or_remove_cart_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/presentation/controller/add_or_remove_cart_bloc/add_or_remove_cart_event.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/presentation/controller/add_or_remove_cart_bloc/add_or_remove_cart_state.dart';
import 'package:matgary/core/global/shared_widgets/elvated_bottom.dart';
import 'package:matgary/core/global/shared_widgets/show_dialog.dart';
import 'package:matgary/core/global/toast/toast.dart';
import 'package:matgary/favorite/presentation/controller/remove_local_list_bloc/remove_local_list_bloc.dart';
import 'package:matgary/home/domain/entities/home_entity.dart';
import 'package:matgary/product_details/presentation/controller/add_and_remove_favorite_bloc/add_and_remove_favorite_bloc.dart';
import 'package:matgary/product_details/presentation/controller/add_and_remove_favorite_bloc/add_and_remove_favorite_event.dart';

class FavoriteListCard extends StatelessWidget {
   List<ProductsEntity>? localDataEntityList;
  final int index;

   FavoriteListCard(
      {super.key, required this.localDataEntityList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        side: const BorderSide(color: Colors.grey, width: 0.5),
      ),
      child: SizedBox(
        height: 220.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              width: 120.w,
              height: 170.h,
              fit: BoxFit.fitHeight,
              imageUrl: localDataEntityList![index].image!,
              placeholder: (context, url) => const Icon(
                Icons.image,
                size: 80,
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.image,
                size: 80,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    GlobalShowDialog dialog = GlobalShowDialog(
                      titleText: 'حذف المنتج',
                      questionText: 'هل تريد حذف ذلك المنتج من قائمة المفضلة ؟',
                      onPressForAccept: (){
                        var addAndRemoveFavoriteBloc = context.read<AddAndRemoveFavoriteBloc>();
                        addAndRemoveFavoriteBloc.add(GetAddFavoriteEvent(id: localDataEntityList![index].id!));
                        // local list remove
                        localDataEntityList!.removeWhere((element) => element.id == localDataEntityList![index].id);
                        Navigator.pop(context);
                      },
                      onPressForRefuse: (){
                        Navigator.pop(context);
                      },
                    );
                    dialog.globalShowDialog(context);
                    // from api

                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    size: 35,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200.w,
                  margin: const EdgeInsets.only(right: 10),
                  child: Text(
                    localDataEntityList![index].name!,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 18.0),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Text(
                        '${localDataEntityList![index].price.toString()} EGP',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 20),
                      ),
                      if (localDataEntityList![index].discount != 0)
                        Text(
                          '${localDataEntityList![index].oldPrice!} EGP',
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
                ),
                BlocConsumer<AddOrRemoveCartBloc,AddOrRemoveCartState>(
                  listenWhen: (previous, current) =>previous.addOrRemoveCartRequestState != current.addOrRemoveCartRequestState,
                  buildWhen: (previous, current) =>previous.addOrRemoveCartRequestState != current.addOrRemoveCartRequestState,
                  listener: (context,addOrRemoveCartState){
                    switch(addOrRemoveCartState.addOrRemoveCartRequestState){
                      case AddOrRemoveCartRequestState.initial:
                        print('initial cart');
                      case AddOrRemoveCartRequestState.loading:
                        print('loading cart');
                      case AddOrRemoveCartRequestState.success:
                        print(addOrRemoveCartState.addOrRemoveCartRequestState.hashCode);
                        ToastMessages.showToast(message: addOrRemoveCartState.addOrRemoveCartEntity!.message!);
                      case AddOrRemoveCartRequestState.error:
                        ToastMessages.showToast(message: addOrRemoveCartState.addOrRemoveCartErrorMessage,backGroundColor: Colors.redAccent);
                    }
                  },
                  builder:(context,addOrRemoveCartState)=>localDataEntityList![index].inCart == false ? Container(
                    margin: const EdgeInsets.only(right: 20, top: 20),
                    child: GlobalElevatedButton(
                      bottomText: ' إلي عربة التسوق',
                      onPress: () {
                        context.read<AddOrRemoveCartBloc>().add(GetAddOrRemoveCartEvent(id: localDataEntityList![index].id!));
                        localDataEntityList![index].inCart = true;

                      },
                      bottomSize: const Size(150, 50),
                      bottomPadding: const EdgeInsets.symmetric(),
                    ),
                  ):Container(
                    margin: const EdgeInsets.only(right: 20, top: 20),
                    child: GlobalElevatedButton(
                      backGroundColor: Colors.red,
                      bottomText: 'حذف من العربة',
                      onPress: () {
                        context.read<AddOrRemoveCartBloc>().add(GetAddOrRemoveCartEvent(id: localDataEntityList![index].id!));
                        localDataEntityList![index].inCart = false;
                      },
                      bottomSize: const Size(150, 50),
                      bottomPadding: const EdgeInsets.symmetric(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
