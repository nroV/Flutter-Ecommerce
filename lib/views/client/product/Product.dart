
import 'package:ecommerce/model/Product/CartModel.dart';
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:flutter/material.dart';

import '../../../model/Product/ProductModel.dart';
import '../../../viewmodel/cart/cart_bloc.dart';
import '../../order/Checkout.dart';
import '../Home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductDetailScreen extends StatefulWidget {
  Results? product;
 ProductDetailScreen({Key? key,this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var imgindexx =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.product!.id);
  }
  onChangeimage(Context,index){
    print(index);
    print("Click on Images");
      setState(() {
        imgindexx = index;
      });
  }
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(

        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(

                elevation: 0,

                expandedHeight: 400,
                backgroundColor: Colors.white10,


                flexibleSpace: Image.network('${widget.product!.imgid![imgindexx].images}'
                  ,fit: BoxFit.contain,
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

                            child: Text("${widget.product!.productname}",

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
                              child: Text("\$ ${widget.product!.price}",style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff1C3A2E),
                                fontWeight: FontWeight.w500
                              ),),
                            ),
                          )
                        ],
                      ),

                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Icon(Icons.star,color: Colors.orange,size: 19,),
                              Text("${widget.product!.avgRating}",
                                style: Theme.of(context).textTheme.headlineSmall,
                              )


                            ],
                          ),
                          // SizedBox(width: 25,
                          //
                          // ),
                          VerticalDivider(),

                          Text("${widget.product!.sellRating} sold",
                          style: Theme.of(context).textTheme.headlineSmall,
                          )

                        ],
                      ),
                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(" ${widget.product!.owner?.username?.toUpperCase()}"),
                          if(widget.product?.discount != 0)
                          Container(
                            width:78,
                            height: 26,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xffFFEBE5),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("\% ${widget.product?.discount} off",style: TextStyle(
                                fontSize:12.8,
                                color: Color(0xffF04438),
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                        ],
                      ),


                      //TODO available section color


                      DetailSizeColor(attributes: widget?.product?.attribution,images: widget?.product?.imgid,
                        function: onChangeimage,
                      ),

                      //TODO available Product Detail
                      ProductDetailSection(desc:widget.product?.description,attribution: widget?.product?.attribution, ),



                      //TODO review section here
                  ProductReviewPart(product:widget.product),

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:      BlocConsumer<CartBloc, AllCart>(
  listener: (context, state) {
    // TODO: implement listener
    // print("Listener run");
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Added to cart") ));
  },
  builder: (context, state) {
    return Container(
          margin: EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Expanded(
                  child: ElevatedButton(onPressed: () {

                    BlocProvider.of<CartBloc>(context,listen: false ).add(CartToAdd(cartitem: CartItem(
                      discount: widget.product!.discount,
                      qty: 1,
                      productid:  widget.product!.id,
                      attribution: widget.product!.attribution,
                      imgurl: widget.product!.imgid![0].images,
                      price: widget.product!.price,
                      producttitle:  widget.product!.productname,

                    )));

                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black.withOpacity(0.14)),
                              borderRadius: BorderRadius.circular(3)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/logo/shopping-cart.png',
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                              color: Colors.black
                          ),
                          SizedBox(width: 10,),
                          Text("Add to Cart",style: TextStyle(
                              fontSize: 12.8,
                              color: Colors.black
                          ),)
                        ],
                      )),
                ),
                SizedBox(width: 10,),

                Expanded(
                  child: ElevatedButton(onPressed: () {

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
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {


                                return Checkout();
                              },));
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
      );
    }
}

class DetailSizeColor extends StatefulWidget {
  Attribution? attributes;
  List<Imgid>? images;
  Function? function;
 DetailSizeColor({
    super.key,
   this.attributes,
   this.images,
   this.function
  });

  @override
  State<DetailSizeColor> createState() => _DetailSizeColorState();
}

class _DetailSizeColorState extends State<DetailSizeColor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text("Available Size and Color",style: Theme.of(context).textTheme.displayMedium,),
        SizedBox(height: 10,),
        Row(

          children: List.generate(widget!.images!.length, (index) {
            var imglink = widget!.images![index].images;
           return  Expanded(child: Container(

              child:
              InkWell(
                onTap: () => widget.function!(context,index),

                  child: Image.network('${imglink}'))
              ,margin: EdgeInsets.only(right: 10),

            ));
          }),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}

class ProductDetailSection extends StatefulWidget {
  var desc;
  Attribution? attribution;
 ProductDetailSection({
    super.key,
   this.desc,this.attribution
  });

  @override
  State<ProductDetailSection> createState() => _ProductDetailSectionState();
}

class _ProductDetailSectionState extends State<ProductDetailSection> {

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Size"),
                Text("${widget.attribution!.size}",style: TextStyle(
                    fontWeight: FontWeight.w500
                ),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Material"),
                Text("${widget.attribution!.materialName}",style: TextStyle(
                    fontWeight: FontWeight.w500
                ),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Weight"),
                Text("${widget.attribution!.weight}",style: TextStyle(
                    fontWeight: FontWeight.w500
                ),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Model"),
                Text("${widget.attribution!.model}",style: TextStyle(
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
   ProductReviewPart({
    super.key, this.product,
  });

  @override
  State<ProductReviewPart> createState() => _ProductReviewPartState();
}

class _ProductReviewPartState extends State<ProductReviewPart> {
  @override
  Widget build(BuildContext context) {
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
                Text("${widget.product!.avgRating!.roundToDouble()}",style: TextStyle(
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

