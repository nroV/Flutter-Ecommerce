import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/products/product_bloc.dart';
import 'package:ecommerce/views/client/category/category.dart';
import 'package:ecommerce/views/client/product/BestSelling.dart';
import 'package:ecommerce/views/client/utilities/searchscreen.dart';
import 'package:ecommerce/views/order/Cart.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../widget/Product/CustomCard.dart';


class NewArrivalSection extends StatefulWidget {
  const NewArrivalSection({
    super.key,
  });

  @override
  State<NewArrivalSection> createState() => _NewArrivalSectionState();
}

class _NewArrivalSectionState extends State<NewArrivalSection> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(FetchProduct());
  }
  Widget build(BuildContext context) {
    return Expanded(

        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {

            if(state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is  ProductCompleted){
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
            if(state is  ProductError){
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

