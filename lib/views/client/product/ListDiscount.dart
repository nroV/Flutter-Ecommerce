import 'package:ecommerce/res/constant/appcolor.dart';
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

import '../../widget/Product/CustomCard.dart';


class DiscountListSec extends StatefulWidget {
  const DiscountListSec({
    super.key,
  });

  @override
  State<DiscountListSec> createState() => _DiscountListSecState();
}

class _DiscountListSecState extends State<DiscountListSec> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductDiscountBloc>(context).add(DiscountProduct());
  }
  Widget build(BuildContext context) {
    return Expanded(

        child: BlocConsumer<ProductDiscountBloc, ProductState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {

            if(state is ProductLoadingDiscount) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is  ProductDiscountCompleted){
              var productlen = state.product!.results!.length;
              var allproduct = state.product!.results;
              int len =  productlen;
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: len ?? 0,

                itemBuilder: (context, index) {

                  return CustomCardList(product:allproduct![index],len: len,);
                },);
            }
            if(state is  ProductErrorDiscount){
              return Center(
                child: Text("Error has been occur"),
              );
            }
            else{
              return Center(
                child: Text("sth error"),
              );
            }

          },
        ));
  }
}

