import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_event.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_state.dart';
import 'package:matgary/home/presentation/screens/home_screen/product_card_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(sl())..add(const GetHomeEvent()),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) {
          print('previous state${previous.requestState}');
          print('current state${current.requestState}');
          if(previous.requestState != current.requestState){
            return true;
          }else{
            return false;
          }
        },

        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.initial:
              return const Center(
                child: Text('initial'),
              );
            case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            case RequestState.success:
              var productList = state.homeEntity!.data!.products;
              var bannertList = state.homeEntity!.data!.banners;
              List<Widget> imageWidgets = bannertList!.map((myList) => Image.network(
                        myList.image!,
                        width: double.maxFinite.w,
                        height: double.maxFinite.h,
                        fit: BoxFit.fill,
                        errorBuilder: (context, object, stakTrac) {
                          return const Center(
                            child: Text('error load image'),
                          );
                        },
                      )).toList();
              return Scaffold(
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 50,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Container(
                          height: 200,
                          child: CarouselSlider(
                            items: imageWidgets,
                            options: CarouselOptions(
                              height: 150.h,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Flexible(
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 8.0, // spacing between rows
                              crossAxisSpacing: 8.0, // spacing between columns
                              childAspectRatio: 1 / 1.2, // (width/height)
                            ),
                            padding: const EdgeInsets.all(8.0),
                            // padding around the grid
                            itemCount: productList!.length,
                            // total number of items
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){

                                },
                                child: ProductCardWidget(productList: productList,index: index,),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              return const Center(child: Text('success'));
            case RequestState.error:
              return const Center(
                child: Text('error'),
              );
          }
        },
      ),
    );
  }
}


//  if (context.bloc<MyDataBloc>().state is MyDataLoaded)