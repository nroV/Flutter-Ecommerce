import 'package:ecommerce/viewmodel/products/product_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/constant/appcolor.dart';
import '../../client/ProductAllScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../client/product/Product.dart';

class GridCardItem extends StatefulWidget {

  GridCardItem();


  @override
  State<GridCardItem> createState() => _GridCardItemState();


}

class _GridCardItemState extends State<GridCardItem> {
  var itemsize = 130;


var listsize = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    // productbloc.add( FetchProduct());


    super.initState();

  }

  Widget build(BuildContext context) {
    BlocProvider.of<ProductBloc>(context).add(FetchProduct());
    return BlocConsumer<ProductBloc,ProductState>(
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
          double len = productlen.toDouble();

          listsize = (len /2 ).floorToDouble() ;
          print(listsize);
          return Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(0),
            height:



            productlen.isOdd ?  360 * (len -   listsize  ) :

            360 * (len -   listsize  )
                ??  0,
            //algrothims infinite scroll


            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Keep Discover", style:
                    Theme
                        .of(context)
                        .textTheme
                        .labelLarge,),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //       return  ProductAllPage(apptitle: 'Discover',);
                    //     },));
                    //   },
                    //   child: Text("See All",style:
                    //   Theme.of(context).textTheme.headlineSmall,),
                    // ),
                  ],
                ),
                SizedBox(height: 20,),
                Expanded(

                  child: GridView.builder(

                    physics: NeverScrollableScrollPhysics(),


                    itemCount: productlen ?? 0,
                    scrollDirection: Axis.vertical,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 290,


                        childAspectRatio: 19 / 12,


                        mainAxisSpacing: 5

                    ),
                    itemBuilder: (context, index) {
                      var product =  allproduct![index];
                      return Container(
                        height: 430,

                        child: Card(
                          elevation: 0,


                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return ProductDetailScreen(product:product,);
                              },));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Stack(
                                    children: [

                                      Image.network('${product!.imgid![0].images} ',fit: BoxFit.contain,
                                        width: double.maxFinite,
                                        height: 180,



                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 0,
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              Icon(Icons.star, size: 20,
                                                color: Colors.amberAccent,),
                                              Text("${product.avgRating}", style: TextStyle(

                                              ),)
                                            ],
                                          ),
                                        ),
                                      )

                                    ],


                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      if(product.discount !=0 )
                                      Container(


                                          decoration: BoxDecoration(
                                              color: Color(
                                                  AppColorConfig.negativelight),
                                              border: Border.all(color: Color(
                                                  AppColorConfig.negativecolor),
                                                  width: 1
                                              )
                                          ),
                                          padding: EdgeInsets.all(4),
                                          width: 70,


                                          child:

                                          Text("${product.discount } % ", style: TextStyle(


                                            color: Color(
                                                AppColorConfig.negativecolor),
                                            fontSize: 12.8
                                            // backgroundColor:    Color(AppColorConfig.negativelight)
                                          ),)),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text("${product.sellRating} sold", style: TextStyle(
                                            fontSize: 12.8,
                                            color: Color(AppColorConfig.success)
                                        ),),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8, top: 9),
                                    child: Text("${product.productname}", style: TextStyle(
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    padding: const EdgeInsets.only(left: 8,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text("\$ ${product.price}", style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20

                                        ),),


                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(right: 10),

                                          decoration: BoxDecoration(

                                            shape: BoxShape.circle,

                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Color(
                                                AppColorConfig.success),
                                            radius: 12,


                                            child: Image.asset(
                                              'assets/logo/shopping-cart.png',
                                              fit: BoxFit.cover,
                                              width: 14,
                                              height: 14,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },

                  ),
                ),


              ],
            ),
          );
        }
        else{
          return Center(
            child: Text("Error has been occur"),
          );
        }


      },
    );
  }
}