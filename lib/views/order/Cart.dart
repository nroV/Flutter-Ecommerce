import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/cart/cart_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/Product/CartModel.dart';
import '../widget/Product/CustomButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Checkout.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int? userid;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserSharePrefs();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text("Your Cart", style: TextStyle(
              color: Colors.black
          ),),
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          centerTitle: true,
          backgroundColor: Colors.white.withOpacity(0.34),
          elevation: 0),
      body: SafeArea(
        child: SizedBox.expand(
          child: BlocConsumer<CartBloc, AllCart>(
            listener: (context, state) {
              // TODO: implement listener
              print(state.itemcart?.length);

              // ScaffoldMessenger.of(context).hideCurrentSnackBar();

                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Added to cart") ));



            },
            builder: (context, state) {
              return
                state.itemcart?.length == 0 ?
                  Center(
                    child: Text("Your cart is empty",style: TextStyle(
                      fontSize: 12.8
                    ),),
                  ) :
             ListView.builder(
                itemCount: state.itemcart?.length ?? 0,

                itemBuilder: (context, index) {
                  var cart = state.itemcart![index];
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black.withOpacity(0.2)
                        )
                    ),
                    child: ListTile(
                      isThreeLine: true,
                      style: ListTileStyle.drawer,

                      leading: Image.network(
                          '${cart.imgurl}'),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text('${cart.producttitle}'),
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
                          Text('\$ ${cart.price}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [

                              Row(
                                children: [
                                  Text('Size: L ', style: TextStyle(
                                      fontSize: 10.8
                                  ),),
                                  Text('Color: Red ', style: TextStyle(
                                      fontSize: 10.8
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
            },
          ),
        ),
      ),
      bottomSheet: BlocConsumer<CartBloc, AllCart>(
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
          return Container(

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
                    Text('\$ ${total ?? 0}', style: TextStyle(
                        fontSize: 15.8,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
                Divider(),
           ElevatedButton(

              onPressed: () {
            print("Press click");
            Navigator.push(context, MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) {
              return Checkout(cartitem: state.itemcart,

              discount: 0,
                qtytotal: qtytotal,
                subtotal: total,
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
      ),
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


