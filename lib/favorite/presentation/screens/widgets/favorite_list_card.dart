import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/shared_widgets/elvated_bottom.dart';
import 'package:matgary/favorite/domain/entities/favorite_list_entity.dart';

class FavoriteListCard extends StatelessWidget {
  final List<DataEntity>? favList;
  final int index;
  const FavoriteListCard({super.key, required this.favList,required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
      const EdgeInsets.only(top: 20, left: 10, right: 10),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        side:
        const BorderSide(color: Colors.grey, width: 0.5),
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
              imageUrl: favList![index].product!.image!,
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
                    favList![index].product!.name!,
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
                        '${favList![index].product!.price.toString()} EGP',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 20),
                      ),
                      if (favList![index].product!.discount != 0)
                        Text(
                          '${favList![index].product!.oldPrice!} EGP',
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
                  margin: const EdgeInsets.only(right: 20,top: 20),
                  child: GlobalElevatedButton(
                    bottomText: ' إلي عربة التسوق',
                    onPress: () {},
                    bottomSize: const Size(150, 50),
                    bottomPadding: const EdgeInsets.symmetric(),
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
