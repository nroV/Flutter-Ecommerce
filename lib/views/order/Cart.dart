import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/cart/cart_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/Product/CartModel.dart';
import '../../viewmodel/products/address_bloc.dart';
import '../widget/Product/CustomButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/other/EmptyWidget.dart';
import 'Checkout.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {



var cartlength = 0;
int? userid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserSharePrefs();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

          title: Text("Your Cart", style: TextStyle(
              color: Colors.black
          ),),
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          // centerTitle: true,
          backgroundColor: Colors.white.withOpacity(0.34),
          elevation: 0),
      body: SafeArea(

        child: SizedBox.expand(

          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: BlocConsumer<CartBloc, AllCart>(
              listener: (context, state) {
                // TODO: implement listener

                setState(() {
                  cartlength = state.itemcart?.length ?? 0;
                  print(state.itemcart?.length);
                });

                // ScaffoldMessenger.of(context).hideCurrentSnackBar();

                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Added to cart") ));



              },
              builder: (context, state) {
                if (state.itemcart?.length == 0) {
                  return EmptyCard(
                    maintitle: 'Opps Your Cart is Empty',

                    subtitle: 'Check out our store product right away',
                  img: 'assets/logo/shoppingbag.jpg',
                    btntitle: 'Order Now',

                  );
                } else {
                  return ListView.builder(
                  itemCount: state.itemcart?.length ?? 0,

                  itemBuilder: (context, index) {
                    var cart = state.itemcart![index];
                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.grey.withOpacity(0.35)
                          )
                      ),
                      child: ListTile(
                        isThreeLine: true,
                        style: ListTileStyle.drawer,
                        contentPadding: EdgeInsets.all(14),

                        leading: Image.network(
                            '${cart.imgurl}'),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text('${cart.producttitle}',style: TextStyle(
                              fontSize: 16
                            ),),
                            InkWell(
                              onTap: () {
                                BlocProvider.of<CartBloc>(
                                    context, listen: false).add(
                                    CartRemoveAll(cartitem: CartItem(
                                      discount: cart.discount,
                                      qty: cart.qty,
                                      productid: cart.productid,
                                      attribution: cart.attribution,
                                      imgurl: cart.imgurl,
                                      price: cart.price,
                                      producttitle: cart.producttitle,

                                    )));
                              },
                              child: Icon(
                                Icons.delete, color: Color(0xffC73737), size: 17,),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\$ ${cart.price}',style: TextStyle(
                              fontSize: 15.9,
                              color: Color(AppColorConfig.success)
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [

                                Row(
                                  children: [
                                    Text('Size: ${cart.sizetext} ', style: TextStyle(
                                        fontSize: 12.8
                                    ),),
                                    Text('Color: ${cart.colorid} ', style: TextStyle(
                                        fontSize: 12.8
                                    ),),
                                  ],
                                ),
                                Row(
                                  children: [

                                    InkWell(
                                        onTap: () {
                                          BlocProvider.of<CartBloc>(
                                              context, listen: false).add(
                                              CartToRemove(cartitem: CartItem(
                                                discount: cart.discount,
                                                qty: cart.qty,
                                                productid: cart.productid,
                                                attribution: cart.attribution,
                                                imgurl: cart.imgurl,
                                                price: cart.price,
                                                producttitle: cart.producttitle,
                                                sizeid: cart.sizeid,
                                                colorid: cart.colorid,
                                                imgid: cart.imgid,


                                              )));
                                        },

                                        child: Icon(Icons.remove_circle,
                                          color: Color(
                                              AppColorConfig.negativecolor),)),
                                    SizedBox(width: 20,),
                                    Text('${cart.qty}'),
                                    SizedBox(width: 20,),
                                    InkWell(
                                        onTap: () {
                                          BlocProvider.of<CartBloc>(
                                              context, listen: false).add(
                                              CartToAdd(cartitem: CartItem(
                                                discount: cart.discount,
                                                qty: cart.qty,
                                                productid: cart.productid,
                                                attribution: cart.attribution,
                                                imgurl: cart.imgurl,
                                                price: cart.price,
                                                producttitle: cart.producttitle,
                                                sizeid: cart.sizeid,
                                                colorid: cart.colorid,
                                                imgid: cart.imgid,


                                              )));
                                        },
                                        child: Icon(Icons.add_circle_rounded,
                                          color: Color(AppColorConfig.success),))
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                        // trailing: ,
                      ),

                    );
                  },);
                }
              },
            ),
          ),
        ),
      ),
      bottomSheet:


      BlocConsumer<CartBloc, AllCart>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          double total = 0;
          var qtytotal = 0;
          state.itemcart?.forEach((element) {
            total += (element!.price * element.qty);
            qtytotal += element!.qty!;

          });
          return
            state.itemcart?.length == 0 ?
            Container(
              height: 1,
            ) :
            Container(

            decoration: BoxDecoration(
              color: Colors.white,


            ),
            width: double.maxFinite,
            padding: EdgeInsets.all(15),
            height: 190,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Products Item', style: TextStyle(
                        fontSize: 12.8,
                        color: Colors.grey
                    ),),
                    Text(' ${state.itemcart?.length ?? 0}', style: TextStyle(
                        fontSize: 12.8,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discount', style: TextStyle(
                        fontSize: 12.8,
                        color: Colors.grey
                    ),),
                    Text('\% 0', style: TextStyle(
                        fontSize: 12.8,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal', style: TextStyle(
                        fontSize: 15.8,
                        color: Colors.black
                    ),),
                    Text('\$ ${total.toStringAsFixed(2)?? 0}', style: TextStyle(
                        fontSize: 15.8,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
           SizedBox(height: 14,),

           ElevatedButton(

              onPressed: () {
            print("Press click");
            Navigator.push(context, MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) {
              return Checkout(cartitem: state.itemcart,

              discount: 0,
                qtytotal: qtytotal,
                subtotal: double.parse(total.toStringAsFixed(2)),
                uid: userid,


                

              );
            },));



          },
          style: ElevatedButton.styleFrom(
          backgroundColor:Colors.black,
          elevation: 0,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black.withOpacity(0.14)),
          borderRadius: BorderRadius.circular(10)
          )
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Image.asset('assets/logo/shopping-cart.png',
          width: 20,
          height: 20,
          fit: BoxFit.cover,

          ),
          SizedBox(width: 10,),
          Text("Proceed to Checkout",style: TextStyle(
          fontSize: 12.8,

          ),)
          ],
          ))

              ],
            ),
          );
        },
      )
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton:     Container(
      //
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //
      //
      //   ),
      //   width: double.maxFinite,
      //   padding: EdgeInsets.all(15),
      //   height: 180,
      //   child: Column(
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text('Product Price',style: TextStyle(
      //             fontSize: 12.8,
      //             color: Colors.grey
      //           ),),
      //           Text('\$ 120',style: TextStyle(
      //               fontSize: 12.8,
      //               color: Colors.black,
      //             fontWeight: FontWeight.w500
      //           ),)
      //         ],
      //       ),
      //       Divider(),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text('Discount',style: TextStyle(
      //               fontSize: 12.8,
      //               color: Colors.grey
      //           ),),
      //           Text('\% 0',style: TextStyle(
      //               fontSize: 12.8,
      //               color: Colors.black,
      //               fontWeight: FontWeight.w500
      //           ),)
      //         ],
      //       ),
      //       Divider(),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text('Subtotal',style: TextStyle(
      //               fontSize: 12.8,
      //               color: Colors.grey
      //           ),),
      //           Text('\$ 120',style: TextStyle(
      //               fontSize: 12.8,
      //               color: Colors.black,
      //               fontWeight: FontWeight.w500
      //           ),)
      //         ],
      //       ),
      //       Divider(),
      //       ElevatedButton(onPressed: () {
      //
      //       },
      //           style: ElevatedButton.styleFrom(
      //               backgroundColor: Colors.black,
      //               elevation: 0,
      //               shape: RoundedRectangleBorder(
      //                   side: BorderSide(color: Colors.black.withOpacity(0.14)),
      //                   borderRadius: BorderRadius.circular(3)
      //               )
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Image.asset('assets/logo/shopping-cart.png',
      //                   width: 20,
      //                   height: 20,
      //                   fit: BoxFit.cover,
      //
      //               ),
      //               SizedBox(width: 10,),
      //               Text("Proceed to Checkout",style: TextStyle(
      //                   fontSize: 12.8,
      //
      //               ),)
      //             ],
      //           )),
      //
      //     ],
      //   ),
      // ),

    );
  }

  PushScreen(BuildContext context,userid) {

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Checkout(uid: userid,);
    },));
  }

  void GetUserSharePrefs() async {
    
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("object ${prefs.getInt("userid")}");
    userid = prefs.getInt("userid");
  }
}




