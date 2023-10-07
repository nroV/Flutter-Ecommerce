
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/category/category_bloc.dart';
import 'package:ecommerce/viewmodel/products/product_bloc.dart';
import 'package:ecommerce/views/client/category/category.dart';
import 'package:ecommerce/views/client/product/NewArrival.dart';
import 'package:ecommerce/views/client/utilities/searchscreen.dart';
import 'package:ecommerce/views/order/Cart.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardCategoryScroll extends StatefulWidget{
  CardCategoryScroll();

  @override
  State<CardCategoryScroll> createState() => _CardCategoryScrollState();
}

class _CardCategoryScrollState extends State<CardCategoryScroll> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CategoryBloc>(context).add(FetchCategory());
    super.initState();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<CategoryBloc, CategoryState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is CategoryLoading){
        return Center(
          child: CircularProgressIndicator(),
        );
    }
    if(state is CategoryCompleted){
      var len = state.category!.results!.length;

      return ListView.builder(
        itemCount: len ?? 0,

        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var category =  state.category!.results![index];
          return Container(
            margin: EdgeInsets.only(right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //TODO image here
                CircleAvatar(
                  radius: 40,

                  backgroundImage: NetworkImage('${category.imgid!.images}'),
                ),
                SizedBox(height: 10,),
                Text("${category.categoryname}",style: Theme.of(context).textTheme.headlineSmall,)
              ],
            ),
          );
        },);
    }
    if(state is CategoryError){
      return Center(
        child: Text("Error during fetching"),
      );
    }
    else{
      return Center(
        child: Text("Error during fetching"),
      );
    }

  },
);
  }
}
