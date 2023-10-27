
import 'package:ecommerce/model/Product/CartModel.dart';
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/Review/review_bloc.dart';
import 'package:ecommerce/viewmodel/products/product_fav_bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/Category/ProductCategory.dart';
import '../../../model/Product/ProductModel.dart';
import '../../../viewmodel/cart/cart_bloc.dart';
import '../../../viewmodel/category/category_bloc.dart';
import '../../../viewmodel/products/product_bloc.dart';
import '../../order/Cart.dart';
import '../../order/Checkout.dart';
import '../Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../NavScreen.dart';
import '../Review/Review.dart';
import 'MyProduct.dart';

class ProductDetailScreen extends StatefulWidget {


Results? product;
Product? productv2;
MyProductDetail? productss;
var bothproduct;


 ProductDetailScreen({Key? key,this.product,this.productv2,this.bothproduct,this.productss}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var imgindexx =0;
  var selectedindex = 0;
  var islogin = false;
  var token ;
  var isfav ;
  var click = false;
  var allproduct;
  Product? allproduct2;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    checktoken();


  }
  onChangeimage(Context,index){
    print(index);
    print("Click on Images");
      setState(() {

      });
  }
  void PopUpUnauthorize(BuildContext context) {

    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Login or Register",style: TextStyle(
            fontSize: 18,
            color: Color(AppColorConfig.negativecolor)
        ),),
        content: Text("Require to login first before you can make an order",style: TextStyle(
            fontSize: 12.8,
            fontWeight: FontWeight.w400,

            color: Colors.black
        ),),

        elevation: 0,
        actions: [
          ElevatedButton(

              onPressed: () {
                print('press press');
                Navigator.pop(context);

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor:Color(AppColorConfig.negativecolor),
                  elevation: 0,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black.withOpacity(0.14)),
                      borderRadius: BorderRadius.circular(3)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(width: 10,),
                  Text("Login",style: TextStyle(
                    fontSize: 12.8,

                  ),)
                ],
              ))
        ],
      );
    },);
  }
    Widget build(BuildContext context) {
      // TODO: implement build
      print("Render again");


      if(widget.product == null) {
        print("product v2;");
       allproduct2 = widget.productv2;
        context.read<CategoryBlocProduct>().add(FetchCategoryProduct(categoryid: allproduct2!.category?.id));
        // isfav =      allproduct2?.isfavorite;
      }

      if(widget.productv2 == null){
        print("product v1;");
       allproduct = widget.product;
        context.read<CategoryBlocProduct>().add(FetchCategoryProduct(categoryid: allproduct!.category?.id));
       if(click == false)
        isfav =  allproduct!.isfavorite!;
      }
      // if(widget.productss !=null) {
      //   allproduct = widget!.productss;
      //
      //
      //
      // }
      print(widget!.productss);
      print("Product fav is");
      print(isfav);
      // else {
      //   allproduct = widget.bothproduct;
      //   context.read<CategoryBlocProduct>().add(FetchCategoryProduct(categoryid: allproduct!.category?.id));
      // }

      return
        allproduct !=null ?

      Scaffold(
        backgroundColor: Colors.white,

        body:


        BlocListener<ProductFavBloc, ProductFavState>(
  listener: (context, state) {
    print(state);
    // TODO: implement listener
    if(state is ProductFavSuccess) {
      // BlocProvider.of<ProductDiscountBloc>(context).add(DiscountProduct(page: 1));
      //       context.read<ProductBlocBestRating>().add(SortProduct(rank: "DESC",sortname: "popular",page: 1));
      //       BlocProvider.of<ProductDiscountBloc>(context).add(DiscountProduct(page: 1));
      //
      //       BlocProvider.of<ProductBlocSorting>(context).add (SortProduct(page: 1));
      //       context.read<ProductBlocBestSell>().add(SortProduct(rank: "DESC",sortname: "best_selling",page: 1));
      // context.read<ProductBloc>().add(ClearAllState());
      //       context.read<ProductBloc>().add(FetchProduct(page: 1));

    }
  },
  child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(


                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);

                    },
                    child: CircleAvatar(
                      radius: 13,
                       backgroundColor: Colors.white,

                      child: Icon(Icons.arrow_back,size: 23,color: Colors.black,


                      ),
                    ),
                  ),
                ),

                expandedHeight: 400,
                backgroundColor: Colors.white10,


                flexibleSpace:
                Image.network('${allproduct!.imgid![imgindexx].images}'
                  ,fit: BoxFit.cover,
                  height: 400,

                  // width: double.maxFinite,

                ),
                actions: [
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();

                      setState(() {
                        if ( isfav == false){
                          context.read<ProductFavBloc>().add(AddFavorite(prefs.getInt("userid"), allproduct?.id));
                        }
                        if(isfav == true){
                          context.read<ProductFavBloc>().add(RemoveFavorite(prefs.getInt("userid"), allproduct?.id));
                        }
                        click = true;
                        if(  isfav== true) {
                          isfav = false;
                        }
                        else{
                          isfav= true;
                        }

                      });



                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child:
                        isfav == true ?


                           Icon(Icons.favorite,color: Color(0xffFF6E6E),) :

                            Icon(Icons.favorite_border_outlined,color: Color(0xffFF6E6E),)
                        ,
                      ),
                    ),
                  )
                ],
                iconTheme: IconThemeData(
                  color: Colors.black
                ),

              ),
              //TODO detail here
              SliverToBoxAdapter(

                child: Container(
                  width: double.infinity,

                  margin: EdgeInsets.only(top: 20,left: 15,right: 15),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(

                            child: Text("${allproduct!.productname}",

                            style: Theme.of(context).textTheme.labelLarge,
                            ),
                            flex: 3,
                          ),


                          Expanded(
                            flex: 1,
                            child: Container(
                              width:87,
                              height: 85,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xffE4F9EE),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text("\$ ${allproduct!.price}",style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff1C3A2E),
                                fontWeight: FontWeight.w500
                              ),),
                            ),
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Icon(Icons.star,color: Colors.orange,size: 19,),
                              Text("${allproduct!.avgRating!.roundToDouble()}",
                                style: Theme.of(context).textTheme.headlineSmall,
                              )


                            ],
                          ),
                          // SizedBox(width: 25,
                          //
                          // ),
                          VerticalDivider(),

                          Text("${allproduct!.sellRating} sold",
                          style: Theme.of(context).textTheme.headlineSmall,
                          )

                        ],
                      ),
                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text(" ${widget.product!.owner?.username?.toUpperCase()}"),
                          if(allproduct?.discount != 0)
                          Container(
                            width:78,
                            height: 26,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xffFFEBE5),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("\% ${allproduct?.discount} off",style: TextStyle(
                                fontSize:12.8,
                                color: Color(0xffF04438),
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                        ],
                      ),


                      //TODO available section color


                      DetailSizeColor(

                        attributes: allproduct?.attribution,
                        images: allproduct?.imgid,
                        function: onChangeimage,
                        stock:allproduct?.stockqty,


                      ),

                      //TODO available Product Detail
                      ProductDetailSection(desc:allproduct?.description,

                        attribution: allproduct?.attribution,

                      ),



                      //TODO review section here
                  ProductReviewPart(product:allproduct),

//                       Container(
//                         width: double.maxFinite,
//                         height: 360,
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Related Product",style:
//                                 Theme.of(context).textTheme.labelLarge,),
//
//                               ],
//                             ),
//                             SizedBox(height: 20,),
//
//                             Container(
//                               height: 200,
//
//                               child: BlocConsumer<CategoryBlocProduct, CategoryState>(
//   listener: (context, state) {
//     // TODO: implement listener
//   },
//   builder: (context, state) {
//     if(state is CategoryByidLoading){
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     if(state is CategoryByidError){
//       return Center(
//         child: Text("Error has occur"),
//       );
//     }
//     if(state is CategoryByidCompleted) {
//       return ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: state.product?.product?.length ?? 0,
//         itemBuilder: (context, index) {
//
//           return Container(
//
//             width: 160,
//             height:70,
//
//             child: Card(
//               elevation: 0,
//               margin: EdgeInsets.only(right: 20),
//
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(context,MaterialPageRoute(builder: (context) {
//                     return ProductDetailScreen(
//
//                       productv2:   state.product!.product![index],
//
//
//
//
//
//
//                     )
//                     ;
//                   },));
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//
//                       Container(
//                         height: 120,
//                         child: Stack(
//                           children: [
//                             Image.network('${state.product!.imgid!.images} ',
//
//
//                               width: double.maxFinite,
//                               fit: BoxFit.cover,
//
//                               // height: 280,
//
//
//
//
//                             ),
//                             Positioned(
//                               top: 5,
//                               right: 0,
//                               child: Container(
//                                 margin: EdgeInsets.only(right: 10),
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.star,size: 20,color: Colors.amberAccent,),
//                                     Text("${state.product!.product![index].avgRating}",style: TextStyle(
//
//                                     ),)
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             if(state.product!.product![index].discount !=0 )
//                               Positioned(
//                                 left: 0,
//                                 top: 0,
//                                 child: Container(
//
//
//
//
//
//                                     decoration: BoxDecoration(
//                                         color  :    Color(AppColorConfig.negativelight),
//                                         border: Border.all(color:  Color(AppColorConfig.negativecolor),
//                                             width: 1
//                                         )
//                                     ),
//                                     padding: EdgeInsets.all(4),
//                                     width: 70,
//
//
//
//
//                                     child: Text("${state.product!.product![index].discount} % ",style: TextStyle(
//
//                                       color: Color(AppColorConfig.negativecolor),
//                                       // backgroundColor:    Color(AppColorConfig.negativelight)
//                                     ),)),
//                               ),
//
//                           ],
//
//
//                         ),
//                       ),
//                       SizedBox(height: 5,),
//                       Text(" ${state.product!.product![index].sellRating} sold",style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12.7,
//                           color: Color(AppColorConfig.success)
//
//                       ),),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8,top: 9),
//                         child: Text("${state.product!.product![index].productname}",style: TextStyle(
//                             fontSize: 14.8,
//                             fontWeight: FontWeight.w400
//                         ),),
//                       ),
//
//                       Container(
//                         width: double.maxFinite,
//                         padding: const EdgeInsets.only(left: 8),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("\$ ${state.product!.product![index].price}",style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 20
//
//                             ),),
//
//
//
//                             Container(
//                               alignment: Alignment.center,
//                               margin: EdgeInsets.only(right: 10),
//
//                               decoration: BoxDecoration(
//
//                                 shape: BoxShape.circle,
//
//                               ),
//                               child: CircleAvatar(
//                                 backgroundColor:      Color(AppColorConfig.success),
//                                 radius: 12,
//
//
//                                 child: Image.asset('assets/logo/shopping-cart.png',fit: BoxFit.cover,
//                                   width: 14,
//                                   height: 14,
//                                 ),
//                               ),
//                             ),
//
//                           ],
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },);
//     }
//
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//
//   },
// ),
//                             )
//
//                           ],
//                         ),
//                       ),



                      SizedBox(height: 25,)





                    ],
                  ),
                ),
              )

            ],

          ),
        ),
),
      bottomNavigationBar:   BlocConsumer<CartBloc, AllCart>(
  listener: (context, state) {
    // TODO: implement listener
    print("Added to cart");
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          width: 240,


          content: Container(
            height: 50,
          padding: EdgeInsets.all(15),
          alignment: Alignment.center,

          //color: Colors.white,
          decoration: BoxDecoration(color: Colors.black, border: Border.all(width: 0, color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.shopping_cart,color: Colors.white,size: 20,),
                SizedBox(width: 10,),
                Text('Added to Cart',style: TextStyle(
                  color: Colors.white
                ),),
              ],
            ),
          ),
        ), backgroundColor: Colors.transparent,



          elevation: 0, behavior: SnackBarBehavior.floating,)
    );


  },
  builder: (context, state) {
    return Container(
          margin: EdgeInsets.all(10),

      decoration: BoxDecoration(

      ),

      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

      Expanded(
      child: ElevatedButton(onPressed: () {

        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            elevation: 0,
            backgroundColor: Colors.white,
            builder: (context) {
              return FractionallySizedBox(

                heightFactor: 0.9,
                child:   Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child:
                    // DetailSizeColor(
                    //
                    //   attributesv2: allproduct2?.attribution,
                    //
                    //   images: allproduct2!.imgid,
                    //   function: onChangeimage,
                    //   product: allproduct2,
                    //   price:  allproduct2!.price,
                    //   iscart: true,
                    //   stock: allproduct2!.stockqty,
                    //
                    // ),
                    DetailSizeColor(

                      attributes: allproduct?.attribution,

                      images: allproduct!.imgid,
                      function: onChangeimage,
                      product: allproduct!,
                      attributesv2: null,

                      price: allproduct!.price,

                      iscart: true,
                      stock: allproduct!.stockqty,

                    ),
                  ),
                ),
              );
            });



      // BlocProvider.of<CartBloc>(context,listen: false ).add(CartToAdd(cartitem: CartItem(
      //   discount: widget.product!.discount,
      //   qty: 1,
      //   productid:  widget.product!.id,
      //   attribution: widget.product!.attribution,
      //   imgurl: widget.product!.attribution?.colorid![0].imgid?.images,
      //   colorid :  widget.product!.attribution?.colorid![0].id,
      //   price: widget.product!.price,
      //   producttitle:  widget.product!.productname,
      //   sizeid: 0,
      //   sizetext: 'XL'
      //
      //
      // )));

      },
      style: ElevatedButton.styleFrom(
      backgroundColor: Color(AppColorConfig.success),
      elevation: 0,
      shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black.withOpacity(0.14)),
      borderRadius: BorderRadius.circular(3)
      )
      ),
      child:

      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset('assets/logo/shopping-cart.png',
      width: 20,
      height: 20,
      fit: BoxFit.cover,
      color: Colors.white
      ),
      SizedBox(width: 10,),
      Text("Add to Cart",style: TextStyle(
      fontSize: 12.8,
      color: Colors.white
      ),)
      ],
      )),
      ),
      SizedBox(width: 10,),

      Expanded(
      child: ElevatedButton(
       onPressed: () {

      },
      style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      elevation: 0,
      shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black.withOpacity(0.14)),
      borderRadius: BorderRadius.circular(3)
      )
      ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      // Image.asset('assets/logo/shopping-cart.png',
      //     width: 20,
      //     height: 20,
      //     fit: BoxFit.cover,
      //
      // ),
      // SizedBox(width: 10,),
      InkWell(
      onTap: () async {
        if(token !=null){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          print("User id is ");
          print( prefs.getInt('userid'));

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  CartScreen();
          },));
        }
        if(token ==null){
          PopUpUnauthorize(context);
        }
      },
      child: Text("Check Out",style: TextStyle(
      fontSize: 12.8,

      ),),
      )
      ],
      )),
      ),
      ]
      ),
      );
  },
),




      ) :
        Scaffold(
          backgroundColor: Colors.white,

          body:


          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(

                  elevation: 0,

                  expandedHeight: 400,
                  backgroundColor: Colors.white10,


                  flexibleSpace:
                  Image.network('${allproduct2!.imgid![imgindexx].images}'
                    ,fit: BoxFit.cover,
                    height: 400,

                    // width: double.maxFinite,

                  ),
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.white,

                        child: Icon(Icons.arrow_back,size: 23,color: Colors.black,


                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite,color: Color(0xffFF6E6E),),
                      ),
                    )
                  ],
                  iconTheme: IconThemeData(
                      color: Colors.black
                  ),

                ),
                //TODO detail here
                SliverToBoxAdapter(

                  child: Container(
                    width: double.infinity,

                    margin: EdgeInsets.only(top: 20,left: 15,right: 15),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(

                              child: Text("${allproduct2!.productname}",

                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              flex: 3,
                            ),


                            Expanded(
                              flex: 1,
                              child: Container(
                                width:87,
                                height: 85,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffE4F9EE),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text("\$ ${allproduct2!.price}",style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff1C3A2E),
                                    fontWeight: FontWeight.w500
                                ),),
                              ),
                            )
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Icon(Icons.star,color: Colors.orange,size: 19,),
                                Text("${allproduct2!.avgRating!.roundToDouble()}",
                                  style: Theme.of(context).textTheme.headlineSmall,
                                )


                              ],
                            ),
                            // SizedBox(width: 25,
                            //
                            // ),
                            VerticalDivider(),

                            Text("${allproduct2!.sellRating} sold",
                              style: Theme.of(context).textTheme.headlineSmall,
                            )

                          ],
                        ),
                        SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(" ${widget.product!.owner?.username?.toUpperCase()}"),
                            if(allproduct2?.discount != 0)
                              Container(
                                width:78,
                                height: 26,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffFFEBE5),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text("\% ${allproduct2?.discount} off",style: TextStyle(
                                    fontSize:12.8,
                                    color: Color(0xffF04438),
                                    fontWeight: FontWeight.w500
                                ),),
                              ),
                          ],
                        ),


                        // //TODO available section color
                        // DetailSizeColor(
                        //
                        //   attributes: allproduct?.attribution,images: allproduct?.imgid,
                        //   function: onChangeimage,
                        //
                        //   stock:allproduct?.stockqty,
                        // ),

                        DetailSizeColor(


                          attributesv2: allproduct2?.attribution,

                          images: allproduct2?.imgid,
                          function: onChangeimage,

                          stock:allproduct2?.stockqty,
                        ),

                        //TODO available Product Detail
                        ProductDetailSection(
                          desc:allproduct2?.description,

                          attributionv2: allproduct2?.attribution, ),



                        //TODO review section here
                        ProductReviewPart(productv2:allproduct2),

                        Container(
                          width: double.maxFinite,
                          height: 360,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Related Product",style:
                                  Theme.of(context).textTheme.labelLarge,),
                                  InkWell(
                                    onTap: () {

                                    },
                                    child: Text("See All",style:
                                    Theme.of(context).textTheme.headlineSmall,),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),

                              Container(
                                height: 300,

                                child: BlocConsumer<CategoryBlocProduct, CategoryState>(
                                  listener: (context, state) {
                                    // TODO: implement listener
                                  },
                                  builder: (context, state) {
                                    if(state is CategoryByidLoading){
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if(state is CategoryByidError){
                                      return Center(
                                        child: Text("Error has occur"),
                                      );
                                    }
                                    if(state is CategoryByidCompleted) {
                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {

                                          return   CardHoriScroll();
                                        },);
                                    }

                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );

                                  },
                                ),
                              )

                            ],
                          ),
                        ),





                        SizedBox(height: 25,)





                      ],
                    ),
                  ),
                )

              ],

            ),
          ),
          bottomNavigationBar:   BlocConsumer<CartBloc, AllCart>(
            listener: (context, state) {
              // TODO: implement listener
              print("Added to cart listender");
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart')));

            },
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.all(10),

                decoration: BoxDecoration(

                ),

                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Expanded(
                        child: ElevatedButton(onPressed: () {

                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              elevation: 0,
                              backgroundColor: Colors.white,
                              builder: (context) {
                                return FractionallySizedBox(

                                  heightFactor: 0.9,
                                  child:   Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: SingleChildScrollView(
                                      // DetailSizeColor(
                                      //
                                      //   attributes: allproduct?.attribution,
                                      //
                                      //   images: allproduct!.imgid,
                                      //   function: onChangeimage,
                                      //   product: allproduct!,
                                      //   price: allproduct!.price,
                                      //
                                      //   iscart: true,
                                      //   stock: allproduct!.stockqty,
                                      //
                                      // ),

                                      child: DetailSizeColor(

                                        attributesv2: allproduct2?.attribution,

                                        images: allproduct2!.imgid,
                                        function: onChangeimage,
                                        product: allproduct2,
                                        price:  allproduct2!.price,
                                        iscart: true,
                                        stock: allproduct2!.stockqty,

                                      ),
                                    ),
                                  ),
                                );
                              });



                          // BlocProvider.of<CartBloc>(context,listen: false ).add(CartToAdd(cartitem: CartItem(
                          //   discount: widget.product!.discount,
                          //   qty: 1,
                          //   productid:  widget.product!.id,
                          //   attribution: widget.product!.attribution,
                          //   imgurl: widget.product!.attribution?.colorid![0].imgid?.images,
                          //   colorid :  widget.product!.attribution?.colorid![0].id,
                          //   price: widget.product!.price,
                          //   producttitle:  widget.product!.productname,
                          //   sizeid: 0,
                          //   sizetext: 'XL'
                          //
                          //
                          // )));

                        },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(AppColorConfig.success),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black.withOpacity(0.14)),
                                    borderRadius: BorderRadius.circular(3)
                                )
                            ),
                            child:

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/logo/shopping-cart.png',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.cover,
                                    color: Colors.white
                                ),
                                SizedBox(width: 10,),
                                Text("Add to Cart",style: TextStyle(
                                    fontSize: 12.8,
                                    color: Colors.white
                                ),)
                              ],
                            )),
                      ),
                      SizedBox(width: 10,),

                      Expanded(
                        child: ElevatedButton(

                            onPressed: () {



                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black.withOpacity(0.14)),
                                    borderRadius: BorderRadius.circular(3)
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Image.asset('assets/logo/shopping-cart.png',
                                //     width: 20,
                                //     height: 20,
                                //     fit: BoxFit.cover,
                                //
                                // ),
                                // SizedBox(width: 10,),
                                InkWell(
                                  onTap: () async {
                                    if(token !=null){
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      print("User id is ");
                                      print( prefs.getInt('userid'));

                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return  CartScreen();
                                      },));
                                    }
                                    if(token ==null){
                                      PopUpUnauthorize(context);
                                    }
                                  },
                                  child: Text("Check Out",style: TextStyle(
                                    fontSize: 12.8,

                                  ),),
                                )
                              ],
                            )),
                      ),
                    ]
                ),
              );
            },
          ),




        )

      ;
    }

  void checktoken() async  {

    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    token = prefs.getString("token");
  }
}

class DetailSizeColor extends StatefulWidget {
  AttributionCategory? attributesv2;
  var attributes;
  var product;
  var price;
  // List<Imgid>? images;
  var images;
  Function? function;
  var iscart ;
  var stock;
 DetailSizeColor({
    super.key,
   this.product,
   this.attributes,
   this.images,
   this.function,
   this.stock,
   this.iscart,
   this.price,
   this.attributesv2
  });

  @override
  State<DetailSizeColor> createState() => _DetailSizeColorState();
}

class _DetailSizeColorState extends State<DetailSizeColor> {
  var isselectedimg ;
var attri;
  var imgindexx =0;


  var sizeindex = 0;
  @override


  Widget build(BuildContext context) {
    print(imgindexx);
    print("state update");
    if(widget?.attributes == null){

      print("attributes is null");
      attri = widget.attributesv2;
      print(widget.attributesv2);
    }
    else{

      print("attributev2 is null");
      print(widget?.attributes!);
      attri = widget.attributes;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.iscart !=null)
        Image.network('${attri?.colorid![imgindexx].imgid?.images}',
        fit: BoxFit.cover,
          width: double.maxFinite,
          height: 200,
        ),
        SizedBox(height: 10,),
        if(widget.iscart !=null)

        SizedBox(height: 20,),
        if(widget.price !=null)
        Text("\$ ${widget.price }",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Color(AppColorConfig.success)
        ),),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Stock Available ${widget.stock ?? 0}",style: Theme.of(context).textTheme.displayMedium,),
            Icon(Icons.arrow_forward_ios,size: 14,)
          ],
        ),
        Text("${attri?.colorid?.length ?? 0} Color, ${attri?.size?.length ?? 0} Size",style:TextStyle(
          fontSize: 12.7
        )),
        SizedBox(height: 10,),
        Text("Color: ${attri?.colorid?[imgindexx].color}",style: Theme.of(context).textTheme.displayMedium,),
        SizedBox(height: 20,),
        Row(

          children: List.generate(attri?.colorid?.length ?? 0, (index) {

            var imglink = attri?.colorid?[index].imgid?.images;
            // print(imglink);
           return  Expanded(child:

           InkWell(
             onTap: () {
               print("hllo");

               setState(() {
                 imgindexx = index;
               });
               print(imgindexx);
             },
             child: Container(
               width: 140,
               height: 140,
               decoration: BoxDecoration(
                 border: Border.all(
                   color:
                      imgindexx == index ?


                   Color(AppColorConfig.success) : Colors.white
                 )
               ),
                 child: Image.network('${imglink}',
                   fit: BoxFit.contain,

                 )

             ),
           ));
          }),
        ),
        SizedBox(height: 20,),
        Text("Size: ${attri?.size![sizeindex].size}",style: Theme.of(context).textTheme.displayMedium,),
        SizedBox(height: 20,),
        Container(
          width: double.maxFinite,
          height: 30,
          child: ListView.builder(
            itemCount:  attri?.size?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var size =attri?.size;
              return InkWell(
                onTap: () {
                  setState(() {
                    sizeindex =index;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 15),

                  decoration: BoxDecoration(
                    color:
                    sizeindex == index ?


                    Colors.green.withOpacity(0.4) :

                    Colors.grey.withOpacity(0.4)
                    ,
                    borderRadius: BorderRadius.circular(14),

                  ),
                  child: Text("${size![index].size}"),
                ),
              );

          },),
        ),
        SizedBox(height: 20,),
        if(widget.iscart !=null)
          ElevatedButton(onPressed: () {
            // print("ON Press");
            //
            //
            //
            // print(attri.size);
            // print(widget.product.id);
            // print(widget.price);
            // print(widget.product!.productname);
            //
            // print( attri.size![sizeindex].id);
            // print(attri.colorid![imgindexx].imgid?.images);
            // print( attri.size![sizeindex].id);
            // print( attri.size![sizeindex].size);
            // print( attri);
            // print( widget.price);
            // print( attri.colorid![imgindexx].id);
            if(widget.attributesv2 == null) {
              context.read<CartBloc>().add(
                  CartToAdd(

                      cartitem: CartItem(
                          attribution: attri,

                          discount: widget.product.discount,
                          qty: 1,
                          productid:  widget.product!.id,


                          imgurl:attri.colorid![imgindexx].imgid?.images,
                          colorid : attri.colorid![imgindexx].id,
                          price: widget.price,
                          producttitle:  widget.product!.productname,

                          sizeid:   attri.size![sizeindex].id,
                          sizetext: attri.size![sizeindex].size


                      )));
            }
            else{
              context.read<CartBloc>().add(
                  CartToAdd(

                      cartitem: CartItem(
                          attributionv2: attri,

                          discount: widget.product.discount,
                          qty: 1,
                          productid:  widget.product!.id,


                          imgurl:attri.colorid![imgindexx].imgid?.images,
                          colorid : attri.colorid![imgindexx].id,
                          price: widget.price,
                          producttitle:  widget.product!.productname,

                          sizeid:   attri.size![sizeindex].id,
                          sizetext: attri.size![sizeindex].size


                      )));
            }



         Navigator.pop(context);
          },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(AppColorConfig.success),
                  elevation: 0,
                  padding: EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black.withOpacity(0.14)),
                      borderRadius: BorderRadius.circular(13)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo/shopping-cart.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                      color: Colors.white
                  ),
                  SizedBox(width: 10,),
                  Text("Add to Cart",style: TextStyle(
                      fontSize: 12.8,
                      color: Colors.white
                  ),)
                ],
              )),

      ],
    );
  }
}






class ProductDetailSection extends StatefulWidget {
  var desc;
  var attribution;
  AttributionCategory? attributionv2;
 ProductDetailSection({
    super.key,
   this.desc,this.attribution,
   this.attributionv2
  });

  @override
  State<ProductDetailSection> createState() => _ProductDetailSectionState();
}


class _ProductDetailSectionState extends State<ProductDetailSection> {
  var attri;
  @override
  Widget build(BuildContext context) {
    if(widget?.attribution == null){
      attri = widget.attributionv2;
    }
    else{
      attri = widget.attribution;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("Description",style: Theme.of(context).textTheme.displayMedium,),
        SizedBox(height: 10,),
        Text("${widget.desc}",style: Theme.of(context).textTheme.bodySmall,),
        SizedBox(height: 10,),

        //TODO Product Detail section color
        Text("Product Detail",style: Theme.of(context).textTheme.displayMedium,),
        Divider(),
        Column(

          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Size"),
            //     Text("${widget.attribution!.size}",style: TextStyle(
            //         fontWeight: FontWeight.w500
            //     ),),
            //   ],
            // ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Material"),
                Text("${attri.materialName}",style: TextStyle(
                    fontWeight: FontWeight.w500
                ),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Weight"),
                Text("${attri.weight}",style: TextStyle(
                    fontWeight: FontWeight.w500
                ),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Model"),
                Text("${attri.model}",style: TextStyle(
                    fontWeight: FontWeight.w500
                ),),
              ],
            )
          ],
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}


