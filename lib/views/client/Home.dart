
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/cart/cart_bloc.dart';
import 'package:ecommerce/viewmodel/products/product_bloc.dart';
import 'package:ecommerce/viewmodel/products/product_fav_bloc.dart';
import 'package:ecommerce/views/client/category/category.dart';
import 'package:ecommerce/views/client/product/NewArrival.dart';
import 'package:ecommerce/views/client/product/BestSelling.dart';
import 'package:ecommerce/views/client/product/Popular.dart';
import 'package:ecommerce/views/client/product/Product.dart';
import 'package:ecommerce/views/client/product/SuperDeal.dart';
import 'package:ecommerce/views/client/utilities/SearchPage.dart';
import 'package:ecommerce/views/client/utilities/searchscreen.dart';
import 'package:ecommerce/views/order/Cart.dart';
import 'package:ecommerce/views/widget/Product/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../model/Product/ProductModel.dart';
import '../widget/Product/CustomCard.dart';
import '../widget/Product/GridCardItem.dart';
import 'ProductAllScreen.dart';
import 'Review/ReviewPopUp.dart';
import 'category/categoryscroll.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyHomeScreen extends StatefulWidget {
  var log;
 MyHomeScreen({Key? key,this.log}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {


var islogin = false;
var token ;

  var txtdesc = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckAuthorize();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    print("State rebuild");
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: MediaQuery.of(context).size.width*0.20,
        title:  Text("Explore",style: TextStyle(
          fontSize:22,
          color: Colors.black
        ),),


        // CircleAvatar(
        //   radius: 20,
        //   backgroundImage: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80'),
        // ),
        backgroundColor: Colors.white.withOpacity(0.34),
        elevation: 0,

        actions: [
          //TODO search bar and profile cary

          InkWell(
            onTap: () {
              if( token !=null){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  CartScreen();
                },));
              }
              if(token == null){
                PopUpUnauthorize(context);
              }


            },
            child: Container(
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  BlocConsumer<CartBloc, AllCart>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return CircleAvatar(
                    backgroundColor: Colors.white,


                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        badges.Badge(
                          badgeContent: Text( "${state?.itemcart?.length ?? 0}",style: TextStyle(
                              color: Colors.white
                          ),),
                          child:        Image.asset('assets/logo/shopping-bag.png',fit: BoxFit.cover,
                            width: 25,
                            height: 25,

                          ),
                        ),

                      ],
                    ),
                  );
  },
),

                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  SearchPage(
                  titlesearch: "",
                  focus: true,
                );
              },));
            },
            child: Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.black
                  )
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,


                child: Icon(Icons.search_rounded,color: Colors.black,),
              ),
            ),
          )
        ],
      ),
      body: BlocConsumer<ProductFavBloc, ProductFavState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is ProductFavSuccess) {
      return SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    //TODO search bar

                    // Container(
                    //   height: 50,
                    //
                    //   width: double.maxFinite,
                    //   margin: EdgeInsets.only(bottom: 5),
                    //   child: TextField(
                    //
                    //     style: TextStyle(
                    //         fontSize: 13
                    //     ),
                    //
                    //     onTap: () {
                    //
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //           return  SearchScreen();
                    //         },));
                    //
                    //     },
                    //
                    //     onSubmitted: (value) {
                    //       setState(() {
                    //
                    //       });
                    //     },
                    //     readOnly: true,
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(0),
                    //         filled: true,
                    //         hintText:'What are you looking for?',
                    //         prefixIcon: Icon(Icons.search_sharp,color: Colors.black,size: 22,),
                    //
                    //
                    //         fillColor: Color(AppColorConfig.bgfill),
                    //
                    //         floatingLabelStyle: TextStyle(
                    //             color: Colors.black
                    //         ),
                    //         border: OutlineInputBorder(
                    //             borderSide: BorderSide.none,
                    //             borderRadius: BorderRadius.circular(10)
                    //         )
                    //     ),
                    //
                    //   ),
                    // ),
                    //TODO caategory part
                    CustomCarousel(),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          //TODO bar search here
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Categories",style:
                              Theme.of(context).textTheme.labelLarge,),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,

                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        // maintainState: true,
                                        allowSnapshotting: false,


                                        builder: (context) {

                                          return CategorySreen();
                                        },));
                                },
                                child: Text("See All",style:
                                Theme.of(context).textTheme.headlineSmall,),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),



                          //TODO cate tempalte card

                          Container(
                              width: double.maxFinite,
                              height:150,

                              child: CardCategoryScroll())

                        ],
                      ),
                    ),
                    //TODO carousel part




                    //TODO list Special here
                    Container(
                      width: double.maxFinite,
                      height: 540,
                      child: Column(
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

                          NewArrivalSection()
                        ],
                      ),
                    ),

                    //TODO section ratiing
                    BestSellingSection(),
                    //TODO section popular
                    PopularSection(),
                    //TODO section popular
                    SuperDealList(),
                    //TODO section all
                    // GridCardItem(),






                  ],
                ),
              ),
            );
          },

        ),
      );
    }
    else{
      return SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    //TODO search bar

                    // Container(
                    //   height: 50,
                    //
                    //   width: double.maxFinite,
                    //   margin: EdgeInsets.only(bottom: 5),
                    //   child: TextField(
                    //
                    //     style: TextStyle(
                    //         fontSize: 13
                    //     ),
                    //
                    //     onTap: () {
                    //
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //           return  SearchScreen();
                    //         },));
                    //
                    //     },
                    //
                    //     onSubmitted: (value) {
                    //       setState(() {
                    //
                    //       });
                    //     },
                    //     readOnly: true,
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(0),
                    //         filled: true,
                    //         hintText:'What are you looking for?',
                    //         prefixIcon: Icon(Icons.search_sharp,color: Colors.black,size: 22,),
                    //
                    //
                    //         fillColor: Color(AppColorConfig.bgfill),
                    //
                    //         floatingLabelStyle: TextStyle(
                    //             color: Colors.black
                    //         ),
                    //         border: OutlineInputBorder(
                    //             borderSide: BorderSide.none,
                    //             borderRadius: BorderRadius.circular(10)
                    //         )
                    //     ),
                    //
                    //   ),
                    // ),
                    //TODO caategory part
                    CustomCarousel(),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          //TODO bar search here
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Categories",style:
                              Theme.of(context).textTheme.labelLarge,),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,

                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        // maintainState: true,
                                        allowSnapshotting: false,


                                        builder: (context) {

                                          return CategorySreen();
                                        },));
                                },
                                child: Text("See All",style:
                                Theme.of(context).textTheme.headlineSmall,),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),



                          //TODO cate tempalte card

                          Container(
                              width: double.maxFinite,
                              height:150,

                              child: CardCategoryScroll())

                        ],
                      ),
                    ),
                    //TODO carousel part




                    //TODO list Special here
                    Container(
                      width: double.maxFinite,
                      height: 540,
                      child: Column(
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

                          NewArrivalSection()
                        ],
                      ),
                    ),

                    //TODO section ratiing
                    BestSellingSection(),
                    //TODO section popular
                    PopularSection(),
                    //TODO section popular
                    SuperDealList(),
                    //TODO section all
                    // GridCardItem(),






                  ],
                ),
              ),
            );
          },

        ),
      );
    }

  },
),

    );
  }
  void CheckAuthorize() async {
    print("print user id ");
    SharedPreferences? prefs = await SharedPreferences.getInstance();

    prefs.getInt("userid");
    prefs.getBool("islogin");
    islogin =   prefs.getBool("islogin") ?? false;
    print(   prefs!.getInt("userid"));
    token =     prefs.getString("token");
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



  closeform(BuildContext context) {
    Navigator.pop(context);
  }
}





class CardHoriScroll extends StatefulWidget {
  Results? product;
 CardHoriScroll({
    super.key,
   this.product
  });

  @override
  State<CardHoriScroll> createState() => _CardHoriScrollState();
}

class _CardHoriScrollState extends State<CardHoriScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 160,
      height:70,
      margin: EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey.withOpacity(0.24)
          )
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) {
              return ProductDetailScreen(product: widget.product,);
          },));
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                height: 125,
                child: Stack(
                  children: [
                    Image.network('${widget.product!.imgid![0].images} ',


                      width: double.maxFinite,
                      fit: BoxFit.cover,

                      // height: 280,




                    ),
                    Positioned(
                      top: 5,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Icon(Icons.star,size: 20,color: Colors.amberAccent,),
                            Text("${widget.product!.avgRating!.roundToDouble()}",style: TextStyle(

                            ),)
                          ],
                        ),
                      ),
                    ),
                    if(widget.product!.discount !=0 )
                      Positioned(
                       left: 0,
                        top: 0,
                        child:

                        Container(





                            decoration: BoxDecoration(
                                color  :    Color(AppColorConfig.negativelight),
                                border: Border.all(color:  Color(AppColorConfig.negativecolor),
                                    width: 1
                                )
                            ),
                            padding: EdgeInsets.all(4),
                            width: 43,




                            child: Text("${widget.product!.discount} % ",style: TextStyle(

                              color: Color(AppColorConfig.negativecolor),
                              // backgroundColor:    Color(AppColorConfig.negativelight)
                            ),)),
                      ),

                  ],


                ),
              ),
              SizedBox(height: 5,),
              Text(" ${widget.product!.sellRating} sold",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.7,
                color: Color(AppColorConfig.success)

              ),),
              Padding(
                padding: const EdgeInsets.only(left: 8,top: 9),
                child: Text("${widget.product!.productname}",style: TextStyle(
                    fontSize: 14.8,
                    fontWeight: FontWeight.w400
                ),),
              ),

              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ ${widget.product!.price}",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20

                    ),),



                    // Container(
                    //   alignment: Alignment.center,
                    //   margin: EdgeInsets.only(right: 10),
                    //
                    //   decoration: BoxDecoration(
                    //
                    //     shape: BoxShape.circle,
                    //
                    //   ),
                    //   child: CircleAvatar(
                    //     backgroundColor:      Color(AppColorConfig.success),
                    //     radius: 12,
                    //
                    //
                    //     child: Image.asset('assets/logo/shopping-cart.png',fit: BoxFit.cover,
                    //       width: 14,
                    //       height: 14,
                    //     ),
                    //   ),
                    // ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




class CustomCarousel extends StatefulWidget {
  const CustomCarousel({
    super.key,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}



class _CustomCarouselState extends State<CustomCarousel> {
  CarouselController controller = CarouselController();

  var initindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height*0.38,
      child: Column(
        children: [
          //TODO
          Container(

            decoration: BoxDecoration(
              color: Color(AppColorConfig.primaryswatch),
              borderRadius: BorderRadius.circular(10)
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height*0.28,
            child: CarouselSlider.builder(
              carouselController: controller,
              itemCount: 3
              ,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
                    color: Color(AppColorConfig.primaryswatch),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                     Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Special Deal",style: TextStyle(
                                fontSize: 12.9,
                                fontWeight: FontWeight.w400
                              ),),
                              Text("Get 40% off for all items",
                              style: Theme.of(context).textTheme.labelLarge,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                        Expanded(
                          child: Container(
                            child: Image.network('https://images.unsplash.com/photo-1543508282-6319a3e2621f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2030&q=80'),
                          ),
                        ),
                      ],
                    ),
                  ),


              options: CarouselOptions(
              height: 280,

              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                  setState(() {
                   initindex = index;

                  });
              },

              scrollDirection: Axis.horizontal,
            ),
            ),
          ),
          SizedBox(height: 10,),

          Center(
            child: CarouselIndicator(
              count: 3,
              index:  initindex,

              color: Colors.grey,


              height: 10,
              activeColor: Colors.black,
              width: 10,
            ),
          ),



        ],
      ),
    );
  }
}

