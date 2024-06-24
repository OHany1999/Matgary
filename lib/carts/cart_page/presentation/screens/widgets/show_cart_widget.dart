import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/carts/cart_page/domain/entities/get_cart_entity.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_bloc.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_event.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/presentation/controller/update_cart_bloc/update_cart_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/presentation/controller/update_cart_bloc/update_cart_event.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/presentation/controller/delete_cart_bloc/delete_cart_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/presentation/controller/delete_cart_bloc/delete_cart_event.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/presentation/controller/delete_cart_bloc/delete_cart_state.dart';
import 'package:matgary/core/global/shared_widgets/elvated_bottom.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/global/toast/toast.dart';

class ShowCartWidget extends StatelessWidget {
  bool isActive;
  List<CartItemEntity>? localCartItemEntity;
  int? localTotal;

  ShowCartWidget(
      {super.key,
      required this.localCartItemEntity,
      required this.localTotal,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 140.h,
            child: RefreshIndicator(
              color: AppColorsLight.orangeColor3,
              onRefresh: () {
                return Future(
                  () => context.read<GetCartBloc>().add(
                        GetCartEvent(),
                      ),
                );
              },
              child: ListView.separated(
                // to make RefreshIndicator working with listview
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: localCartItemEntity!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 50.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          width: MediaQuery.of(context).size.width - 220,
                          height: 150.h,
                          fit: BoxFit.fitHeight,
                          imageUrl: localCartItemEntity![index].product!.image!,
                          placeholder: (context, url) => const Icon(
                            Icons.image,
                            size: 80,
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image,
                            size: 80,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 15,
                              ),
                              width: 140.w,
                              child: Text(
                                localCartItemEntity![index]
                                    .product!
                                    .name
                                    .toString(),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontSize: 20.0),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 20),
                              width: 140.w,
                              child: Text(
                                '${localCartItemEntity![index].product!.price.toString()} جنية',
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontSize: 20.0),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 5),
                              width: 150.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  localCartItemEntity![index].quantity! <= 1
                                      ? BlocListener<DeleteCartBloc,
                                          DeleteCartState>(
                                          listener: (context, state) {
                                            switch (
                                                state.deleteCartRequestState) {
                                              case DeleteCartRequestState
                                                    .initial:
                                                print('delete initial');
                                              case DeleteCartRequestState
                                                    .loading:
                                                print('delete loading');
                                              case DeleteCartRequestState
                                                    .success:
                                                print('delete success');
                                              case DeleteCartRequestState.error:
                                                print(state
                                                    .deleteCartErrorMessage);
                                            }
                                          },
                                          child: IconButton(
                                              onPressed: () {
                                                context
                                                    .read<DeleteCartBloc>()
                                                    .add(GetDeleteCartEvent(
                                                        id: localCartItemEntity![
                                                                index]
                                                            .id!));
                                                context
                                                    .read<GetCartBloc>()
                                                    .add(GetCartEvent());
                                              },
                                              icon: const Icon(Icons.delete)),
                                        )
                                      : IconButton(
                                          padding:
                                              const EdgeInsets.only(bottom: 15),
                                          iconSize: 30,
                                          onPressed: () {
                                            if (isActive == false) {
                                              context.read<UpdateCartBloc>().add(GetUpdateCartEvent(quantity: localCartItemEntity![index].quantity! - 1, id: localCartItemEntity![index].id!));
                                              context.read<GetCartBloc>().add(GetCartEvent());
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.minimize,
                                          ),
                                        ),
                                  Text(
                                    localCartItemEntity![index]
                                        .quantity
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(fontSize: 28.0),
                                  ),
                                  IconButton(
                                    iconSize: 30,
                                    onPressed: () {
                                      if (isActive == false) {
                                        context.read<UpdateCartBloc>().add(
                                            GetUpdateCartEvent(
                                                quantity:
                                                    localCartItemEntity![index]
                                                            .quantity! +
                                                        1,
                                                id: localCartItemEntity![index]
                                                    .id!));
                                        context
                                            .read<GetCartBloc>()
                                            .add(GetCartEvent());
                                      } else {
                                        print('not active');
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(right: 18, left: 18, top: 15),
                  height: 1.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 100.h,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          'جنية ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 20.0),
                        ),
                        Text(
                          localTotal.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Text(
                      'الاجمالي',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              GlobalElevatedButton(
                bottomText: 'الدفع',
                fontSize: 20,
                onPress: () {},
                bottomSize: const Size(300, 40),
                bottomPadding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
