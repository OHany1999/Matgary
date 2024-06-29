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
import 'package:matgary/carts/general%20_cart_apis/4-add_order/presentation/controller/add_order_bloc/add_order_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/presentation/controller/add_order_bloc/add_order_event.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/presentation/controller/add_order_bloc/add_order_state.dart';
import 'package:matgary/core/global/shared_widgets/elvated_bottom.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:lottie/lottie.dart';

class ShowCartWidget extends StatefulWidget {
  bool isActive;
  List<CartItemEntity>? localCartItemEntity;
  dynamic localTotal;

  ShowCartWidget(
      {super.key,
      required this.localCartItemEntity,
      required this.localTotal,
      required this.isActive});

  @override
  State<ShowCartWidget> createState() => _ShowCartWidgetState();
}

class _ShowCartWidgetState extends State<ShowCartWidget>
    with TickerProviderStateMixin {
  bool isPlay = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                itemCount: widget.localCartItemEntity!.length,
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
                          imageUrl: widget
                              .localCartItemEntity![index].product!.image!,
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
                                widget.localCartItemEntity![index].product!.name
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
                                '${widget.localCartItemEntity![index].product!.price.toString()} جنية',
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
                                  widget.localCartItemEntity![index]
                                              .quantity! <=
                                          1
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
                                                        id: widget
                                                            .localCartItemEntity![
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
                                            if (widget.isActive == false) {
                                              context
                                                  .read<UpdateCartBloc>()
                                                  .add(GetUpdateCartEvent(
                                                      quantity: widget
                                                              .localCartItemEntity![
                                                                  index]
                                                              .quantity! -
                                                          1,
                                                      id: widget
                                                          .localCartItemEntity![
                                                              index]
                                                          .id!));
                                              context
                                                  .read<GetCartBloc>()
                                                  .add(GetCartEvent());
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.minimize,
                                          ),
                                        ),
                                  Text(
                                    widget.localCartItemEntity![index].quantity
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(fontSize: 28.0),
                                  ),
                                  IconButton(
                                    iconSize: 30,
                                    onPressed: () {
                                      if (widget.isActive == false) {
                                        context.read<UpdateCartBloc>().add(
                                            GetUpdateCartEvent(
                                                quantity: widget
                                                        .localCartItemEntity![
                                                            index]
                                                        .quantity! +
                                                    1,
                                                id: widget
                                                    .localCartItemEntity![index]
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
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                color: Colors.grey.shade500,
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(0, 15.h),
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
                          widget.localTotal.toString(),
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
              BlocListener<AddOrderBloc, AddOrderState>(
                listener: (context, state) {
                  switch (state.addOrderRequestState) {
                    case AddOrderRequestState.initial:
                      null;
                    case AddOrderRequestState.loading:
                      null;
                    case AddOrderRequestState.success:
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 250.h, horizontal: 10.w),
                              child: AlertDialog(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                content: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "! تم تأكيد طلبك شكرا",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Lottie.asset(
                                        LottieFiles
                                            .$89782_done_icon_with_long_drop_shadow,
                                        controller: _controller,
                                        width: 40.w,
                                        height: 40.h),
                                  ],
                                ),
                              ),
                            );
                          });
                      isPlay = !isPlay;
                      _controller.reset();
                      _controller.forward();
                    case AddOrderRequestState.error:
                      print(state.addOrderRequestState);
                  }
                },
                child: GlobalElevatedButton(
                  bottomText: 'الدفع',
                  fontSize: 20,
                  onPress: () {
                    context.read<AddOrderBloc>().add(GetAddOrderEvent());
                    context.read<GetCartBloc>().add(GetCartEvent());
                  },
                  bottomSize: const Size(300, 40),
                  bottomPadding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
