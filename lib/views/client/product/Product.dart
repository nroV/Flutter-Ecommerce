
import 'package:ecommerce/model/Product/CartModel.dart';
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:flutter/material.dart';

import '../../../model/Category/ProductCategory.dart';
import '../../../model/Product/ProductModel.dart';
import '../../../viewmodel/cart/cart_bloc.dart';
import '../../order/Cart.dart';
import '../../order/Checkout.dart';
import '../Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../NavScreen.dart';
class ProductDetailScreen extends StatefulWidget {
Results? product;

Product? productv2;


 ProductDetailScreen({Key? key,this.product,this.productv2}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var imgindexx =0;
  var selectedindex = 0;

  var islogin = false;
  var token ;
  Results? allproduct;
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

      if(widget.product == null) {
        print("product v2;");
       allproduct2 = widget.productv2;
      }
      else{
        print("product v1;");
       allproduct = widget.product;
      }
      return
        allproduct !=null ?

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
                Image.network('${allproduct!.imgid![imgindexx].images}'
                  ,fit: BoxFit.cover,
                  height: 400,

                  // width: double.maxFinite,

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
                              Text("${allproduct!.avgRating}",
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

                      // Container(
                      //   width: double.maxFinite,
                      //   height: 360,
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text("Vendor Product",style:
                      //           Theme.of(context).textTheme.labelLarge,),
                      //           InkWell(
                      //             onTap: () {
                      //
                      //             },
                      //             child: Text("See All",style:
                      //             Theme.of(context).textTheme.headlineSmall,),
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(height: 20,),
                      //
                      //       Container(
                      //         height: 300,
                      //
                      //         child: ListView.builder(
                      //           scrollDirection: Axis.horizontal,
                      //           itemBuilder: (context, index) {
                      //
                      //             return   CardHoriScroll();
                      //           },),
                      //       )
                      //
                      //     ],
                      //   ),
                      // ),



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
    print("Added to cart");
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
                                Text("${allproduct2!.avgRating}",
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

                        // Container(
                        //   width: double.maxFinite,
                        //   height: 360,
                        //   child: Column(
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text("Vendor Product",style:
                        //           Theme.of(context).textTheme.labelLarge,),
                        //           InkWell(
                        //             onTap: () {
                        //
                        //             },
                        //             child: Text("See All",style:
                        //             Theme.of(context).textTheme.headlineSmall,),
                        //           ),
                        //         ],
                        //       ),
                        //       SizedBox(height: 20,),
                        //
                        //       Container(
                        //         height: 300,
                        //
                        //         child: ListView.builder(
                        //           scrollDirection: Axis.horizontal,
                        //           itemBuilder: (context, index) {
                        //
                        //             return   CardHoriScroll();
                        //           },),
                        //       )
                        //
                        //     ],
                        //   ),
                        // ),



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
  Attribution? attributes;
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
            print("ON Press");



            print(attri.size);
            print(widget.product.id);
            print(widget.price);
            print(widget.product!.productname);

            print( attri.size![sizeindex].id);
            print(attri.colorid![imgindexx].imgid?.images);
            print( attri.size![sizeindex].id);
            print( attri.size![sizeindex].size);
            print( attri);
            print( widget.price);
            print( attri.colorid![imgindexx].id);
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
  Attribution? attribution;
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

class ProductReviewPart extends StatefulWidget {
  var reviewrating;
  Results? product;
  Product? productv2;
   ProductReviewPart({
    super.key, this.product,
     this.productv2
  });

  @override
  State<ProductReviewPart> createState() => _ProductReviewPartState();
}

class _ProductReviewPartState extends State<ProductReviewPart> {
  var product;
  @override

  Widget build(BuildContext context) {
    if(widget.product == null) {
      product = widget.productv2;
    }
    else{
      product = widget.product;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,


              children: [
                Text("Review",style: Theme.of(context).textTheme.displayMedium,),
                Text(" (45 reviewers)",style: TextStyle(
                    fontSize: 12.6
                ),)
              ],
            ),
            Icon(Icons.arrow_drop_up)
          ],
        ),
        Divider(),
        SizedBox(height: 25,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("${product!.avgRating!.roundToDouble()}",style: TextStyle(
                    fontSize: 40
                ),),
                Text("out of 5",style: TextStyle(
                    fontWeight: FontWeight.w400
                ),),
              ],
            ),
            Row(
              children: [
                Icon(Icons.star,color: Colors.orange,),
                Icon(Icons.star,color: Colors.orange,),
                Icon(Icons.star,color: Colors.orange,),
                Icon(Icons.star,color: Colors.orange,),
                Icon(Icons.star),
              ],
            ),


          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("45 reviews on this product",style: TextStyle(
                fontWeight: FontWeight.w400,
              fontSize: 12.8,
              color: Colors.grey
            ),),
            Row(
              children: [

                Text("Write a review",style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.8,
                    color: Colors.grey
                ),),
                InkWell(
                  child: Icon(Icons.mode_edit_rounded,color: Colors.grey,size: 17,)  ,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 25,),
        Card(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 10),
          color: Color(0xffEFF0F2),
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading:  CircleAvatar(
    radius: 20,
    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80'),
    ),
                  title : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sok piseth',style: TextStyle(
                        fontSize: 12.8
                      ),),
                      Row(
                        children: [
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                        ],
                      ),
                    ],
                  ),

                   trailing:    Text("5m ago",style: TextStyle(
                       fontWeight: FontWeight.w400,
                       fontSize: 10.8,
                       color: Colors.grey
                   ),),
                ),
                Text('I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!',

                style: TextStyle(
                  fontSize: 10.8,
                  color: Color(0xff666666),
                  fontWeight: FontWeight.w400
                ),
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 10),
          color: Color(0xffEFF0F2),
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading:  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80'),
                  ),
                  title : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sok piseth',style: TextStyle(
                          fontSize: 12.8
                      ),),
                      Row(
                        children: [
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                        ],
                      ),
                    ],
                  ),

                  trailing:    Text("5m ago",style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.8,
                      color: Colors.grey
                  ),),
                ),
                Text('I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!',

                  style: TextStyle(
                      fontSize: 10.8,
                      color: Color(0xff666666),
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 10),
          color: Color(0xffEFF0F2),
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading:  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80'),
                  ),
                  title : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sok piseth',style: TextStyle(
                          fontSize: 12.8
                      ),),
                      Row(
                        children: [
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                          Icon(Icons.star,size: 17,color: Color(0xff508A7B),),
                        ],
                      ),
                    ],
                  ),

                  trailing:    Text("5m ago",style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.8,
                      color: Colors.grey
                  ),),
                ),
                Text('I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!',

                  style: TextStyle(
                      fontSize: 10.8,
                      color: Color(0xff666666),
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          ),
        ),

        SizedBox(height: 25,),
      ],
    );
  }
}

