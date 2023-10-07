
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/products/product_bloc.dart';
import 'package:ecommerce/views/client/category/category.dart';
import 'package:ecommerce/views/client/utilities/searchscreen.dart';
import 'package:ecommerce/views/order/Cart.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../Home.dart';
import '../ProductAllScreen.dart';

class NewArrivalSection extends StatefulWidget {
  NewArrivalSection({
    super.key,
  });

  @override
  State<NewArrivalSection> createState() => _NewArrivalSectionState();
}

class _NewArrivalSectionState extends State<NewArrivalSection> {
  ProductBloc productbloc = ProductBloc();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    BlocProvider.of<ProductBloc>(context).add(FetchProduct());

  }
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("New Arrival",style:
              Theme.of(context).textTheme.labelLarge,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  ProductAllPage(apptitle: 'New Arrival',);
                  },));
                },
                child: Text("See All",style:
                Theme.of(context).textTheme.headlineSmall,),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Expanded(

            child: BlocConsumer<ProductBloc,ProductState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {

    if(state is ProductLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if(state is ProductCompleted) {
      var productlen = state.product!.results!.length;
      var allproduct = state.product!.results;
      int len =  productlen;
      return ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount:productlen ,
        itemBuilder: (context, index) {

          return   CardHoriScroll(product: allproduct![index],);
        },);
    }
    else{
      return Center(
        child: Text("Error has been occur"),
      );
    }

  },
),
          )


        ],
      ),
    );
  }
}