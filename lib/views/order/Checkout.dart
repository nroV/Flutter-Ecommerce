
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/products/address_bloc.dart';
import 'package:ecommerce/views/order/GoogleMap/GoogleMapScreen.dart';
import 'package:ecommerce/views/order/Success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/res/constant/stripesecretkey.dart';
import '../../helper/GoogleLocation.dart';
import '../../model/Order/OrderRequest.dart';
import '../../model/Product/CartModel.dart';
import '../../viewmodel/order/order_bloc.dart';
import '../testpayment.dart';
import '../widget/Product/FloatingAction.dart';

import 'package:location/location.dart';

import 'CompleteOrder.dart';
class Checkout extends StatefulWidget {
  List<CartItem>? cartitem;

  var subtotal;
  var qtytotal;

  var discount;
  var uid;
  var imgid;
  var sizeid;

  Checkout ({Key? key,this.cartitem,this.subtotal,this.discount,this.qtytotal,this.uid,this.imgid,this.sizeid}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  Map<String, dynamic>? paymentintent;
 var address;
 var imagepreviewurl;
 var selectedIndexAddress = 0;
 var indexchose =0;
 var initpayment = 0;
 var selectedmethod = 0;
  int? addressid;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<AddressBloc>(context).add(FetchAddress(userid: widget.uid));
    super.initState();
    print("Checkout userid");
    print(widget.uid);



    // BlocProvider.of<AddressBloc>(context).add(FetchAddress(userid: widget!.uid));
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {

    // TODO: implement build
    var cart = widget.cartitem;
    return Scaffold(
      appBar:AppBar(

        title: Text('Check Out',style: TextStyle(
            color: Colors.black
        ),),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        backgroundColor: Colors.white.withOpacity(0.34),
        elevation: 0,


      ),
      body: BlocConsumer<OrderBloc, OrderState>(
  listener: (context, state) {
    // TODO: implement listener
    print("State google is updated");
    print(state);
    if(state is OrderStripePending) {
      List<Productss>? item =[];

      for(int index=0;index<cart!.length;index++) {
        item.add(Productss(
          id: cart![index].productid,
          quantity:  cart![index].qty,
          colorselection: cart![index].colorid,
          size:  cart![index].sizeid,


        ));
      }
      OrderRequestV2 order = OrderRequestV2(

          customer:widget.uid,

          method:
          "online" ,

          products:item

      );

      BlocProvider.of<OrderBloc>(context,listen: false).add(PostOrderEvent( addressid:addressid ,orderRequestV2: order));
    }
  },
  builder: (context, state) {
    if(state is OrderLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if(state is OrderSuccessCompleted) {
      print("Success");
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Success(order: state?.orderReponse,)));
      });
      //TODO use this whenever u want to push neww screen after state updated
      // Navigator.push(context, MaterialPageRoute(
      //   builder: (context) {
      //   return Success();
      // },));
    }
    if(state is OrderError) {
      return Center(
        child: Text("Error has been occur"),
      );
    }
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5,left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Free Shipping",style: TextStyle(
                  fontSize: 12.8,
                  fontWeight: FontWeight.w500,
                  color: Color(AppColorConfig.success)
                ),),
                SizedBox(height: 20,),
                //TODO list product
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.25,
                  child: ListView.builder(
                    itemCount:cart?.length ?? 0,
                    itemBuilder: (context, index) {
                  return Container(

                    margin: EdgeInsets.only(bottom: 10),


                    child: ListTile(
                      onTap: () {

                      },


                      contentPadding: EdgeInsets.all(0),
                      leading: Image.network('${cart![index].imgurl}'

                      ,fit: BoxFit.contain,
                        width: 100,
                        height:100,
                      ),

                      title: Text('${cart![index].producttitle}',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),),
                      subtitle: Text('\$  ${cart![index].price}',style: TextStyle(
                          fontSize: 16.8,
                          fontWeight: FontWeight.w500,
                        color: Color(0xff508A7B)
                      ),),
                      trailing: Text('Qty: ${cart![index].qty}',style: TextStyle(
                          fontSize: 12.8,

                          fontWeight: FontWeight.w400
                      ),),

                    ),
                  );
                  },),
                ),

                //TODO order detail
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Address",style: TextStyle(

                          fontSize: 18,
                        ),),
                        // InkWell(
                        //   onTap: () async {
                        //     var location = await Location().getLocation();
                        //     print("User current location");
                        //     print(location.longitude);
                        //     print(location.latitude);
                        //
                        //
                        //     address = await Navigator.push(
                        //         context, MaterialPageRoute(builder: (context) {
                        //       return GoogleMapScreen(positionlong: location.longitude,
                        //         positionlat: location.latitude,
                        //       );
                        //     },));
                        //
                        //     setState(() {
                        //       print("Got Address back");
                        //       print(address);
                        //     });
                        //   },
                        //
                        //   child: Row(
                        //     children: [
                        //       Icon(Icons.add_circle_rounded),
                        //       SizedBox(width: 7,),
                        //       Text("Add new Address ", style: TextStyle(
                        //
                        //         fontSize: 12.8,
                        //
                        //       ),),
                        //     ],
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //
                        //   },
                        //   child: InkWell(
                        //       onTap: () async {
                        //         var location = await Location().getLocation();
                        //         print("User current location");
                        //         print(location.longitude);
                        //         print(location.latitude);
                        //
                        //
                        //         address = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //             return GoogleMapScreen(positionlong:     location.longitude,
                        //                 positionlat:    location.latitude,
                        //                 );
                        //
                        //         },));
                        //
                        //         setState(() {
                        //           print("Got Address back");
                        //           print(address);
                        //         });
                        //
                        //
                        //       },
                        //       child: Text('Add New',style: TextStyle(
                        //         fontSize: 11
                        //       ),)),
                        // )
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 10,),
                    //TODO address

        //           Container(
        //      width: double.maxFinite,
        //      padding: EdgeInsets.only(top: 35,bottom: 35,left: 15,right: 15),
        //
        //     child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text('My Home address',style: TextStyle(
        //           fontSize: 14,
        //           fontWeight: FontWeight.w500
        //       ),),
        //
        //       address?["homeadd"] == null ?
        //       Text('${ "No address"}',style: TextStyle(
        //           fontSize: 12.8,
        //           color: Colors.grey
        //       ),) :
        //       Text('${  address?["homeadd"]}',style: TextStyle(
        //           fontSize: 12.8,
        //           color: Colors.grey
        //       ),)
        //
        //
        //     ],
        //   ),
        //   decoration: BoxDecoration(
        //       color: Color(0xffF5F5F5)
        //   ),
        // ),
              Container(
                width: double.maxFinite,
                height:


                310,

                child: BlocConsumer<AddressBloc, AddressState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    print("The State of Address is ${state}");
                    if(state is AddressPostDone) {
                      print("THe address is done");
                      context.read<AddressBloc>().add(FetchAddress(userid: widget.uid));
                    }
                  },
                  builder: (context, state) {

                    if(state is AddressLoading) {
                      return Center(
                        child: CircularProgressIndicator(

                        ),
                      );

                    }
                    if(state is AddressError) {
                      return Center(
                        child: CircularProgressIndicator(

                        ),
                      );
                    }
                    if(state is AddressDone) {
                      print("Address Done");
                      print(  state.add?.results?.length );
                      var len =  state.add?.results?.length;
                      print(len);
                      var previewimages;
                      if( state.add?.results!.length != 0 ) {

                        previewimages =  LocationHelper.staticmapurl(latitute: double.parse( state.add!.results![len!-1].latitude!),longtitute:

                        double.parse( state.add!.results![len!-1].longitude!)

                        );
                      }

                      return     state.add?.results?.length  == 0?


                      Container(
                        width: double.maxFinite,


                        margin: EdgeInsets.only(bottom: 10,right: 10),

                        padding: EdgeInsets.only(
                            top: 0, bottom: 35, left: 0, right: 0),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Container(
                              padding:EdgeInsets.all(10) ,
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(

                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on,color: Colors.white,size: 20,),
                                        Text("Current Location",style: TextStyle(
                                            fontSize: 12.8
                                            ,color: Colors.white
                                        ),)
                                      ],
                                    ),
                                    onTap: () {

                                    },
                                  ),
                                  InkWell(


                                    child: Row(
                                      children: [
                                        Icon(Icons.map
                                            ,color: Colors.white,
                                          size: 20,
                                        ),
                                        Text("Select On Map",style: TextStyle(
                                            fontSize: 12.8
                                            ,color: Colors.white
                                        ),)
                                      ],
                                    ),
                                    onTap: () async {
                                      // InkWell(
                                      //   onTap: () {
                                      //
                                      //   },
                                      //   child: InkWell(
                                      //       onTap: () async {
                                      var location = await Location().getLocation();
                                      print("User current location");
                                      print(location.longitude);
                                      print(location.latitude);


                                      address = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return GoogleMapScreen(positionlong:     location.longitude,
                                          positionlat:    location.latitude,
                                        );

                                      },));

                                      setState(() {
                                        print("Got Address back");
                                        print(address);
                                      });
                                      //
                                      //
                                      //       },
                                      //       child: Text('Add New',style: TextStyle(
                                      //         fontSize: 11
                                      //       ),)),
                                      // )
                                    },
                                  )

                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Color(AppColorConfig.success)
                              ),
                            ),
                            SizedBox(height: 85,),
                            Center(child: Text('You have no address picked yet',


                            style: TextStyle(
                              fontSize: 12.8
                            ),
                            )),



                            SizedBox(height: 15,),




                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.2)
                            )
                        ),
                      )  :
                     ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:  state.add?.results!.length  ?? 0  ,

                        itemBuilder: (context, index) {
                          addressid =   state.add?.results?[len!-1].id;
                          return


                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndexAddress = index;

                                });
                                print("Selected addr index");
                                print(selectedIndexAddress);
                              },
                              child: Container(
                                width: double.maxFinite,


                                margin: EdgeInsets.only(bottom: 10,right: 10),

                                padding: EdgeInsets.only(
                                    top: 25, bottom: 35, left: 15, right: 15),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(

                                            child: Row(
                                              children: [
                                                Icon(Icons.location_on),
                                                Text("Current Location",style: TextStyle(
                                                  fontSize: 12.8
                                                ),)
                                              ],
                                            ),
                                            onTap: () {

                                            },
                                          ),
                                          InkWell(


                                            child: Row(
                                              children: [
                                                Icon(Icons.map),
                                                Text("Select On Map",style: TextStyle(
                                                    fontSize: 12.8
                                                ),)
                                              ],
                                            ),
                                            onTap: () async {
                                              // InkWell(
                                              //   onTap: () {
                                              //
                                              //   },
                                              //   child: InkWell(
                                              //       onTap: () async {
                                                      var location = await Location().getLocation();
                                                      print("User current location");
                                                      print(location.longitude);
                                                      print(location.latitude);


                                                      address = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                          return GoogleMapScreen(positionlong:     location.longitude,
                                                              positionlat:    location.latitude,
                                                              );

                                                      },));

                                                      setState(() {
                                                        print("Got Address back");
                                                        print(address);
                                                      });
                                              //
                                              //
                                              //       },
                                              //       child: Text('Add New',style: TextStyle(
                                              //         fontSize: 11
                                              //       ),)),
                                              // )
                                            },
                                          )

                                        ],
                                      ),


                                    SizedBox(height: 15,),
                                    if(previewimages != null )
                                    Image.network('${previewimages}',fit: BoxFit.cover,

                                      width: double.maxFinite,
                                      height: 180,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [


                                        // Text('${
                                        //     selectedIndexAddress == index ?
                                        //         'Selected Address' :
                                        //     state.add?.results![index].description
                                        //
                                        //
                                        // }', style: TextStyle(
                                        //     fontSize: 16,
                                        //     fontWeight: FontWeight.w500
                                        // ),),



                                        // InkWell(
                                        //   onTap: () {
                                        //
                                        //   },
                                        //   child: InkWell(
                                        //       onTap: () async {
                                        //         var location = await Location()
                                        //             .getLocation();
                                        //         print("User current location");
                                        //         print(location.longitude);
                                        //         print(location.latitude);
                                        //
                                        //
                                        //         address = await Navigator.push(context,
                                        //             MaterialPageRoute(
                                        //               builder: (context) {
                                        //                 return GoogleMapScreen(
                                        //                   positionlong: location
                                        //                       .longitude,
                                        //                   positionlat: location
                                        //                       .latitude,
                                        //                 );
                                        //               },));
                                        //
                                        //         setState(() {
                                        //           print("Got Address back");
                                        //           print(address);
                                        //         });
                                        //       },
                                        //       child: Text('Edit', style: TextStyle(
                                        //           fontSize: 10.8,
                                        //         color: Color(AppColorConfig.success)
                                        //       ),)),
                                        // )
                                      ],
                                    ),

                                    SizedBox(height: 10,),

                                    Text('${state.add?.results![len!-1].street}', style: TextStyle(
                                        fontSize: 14.8,
                                        color: Colors.black
                                    ),)


                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2)
                                  )
                                ),
                              ),
                            );
                        },);
                    }
                    else{
                      return Center(
                        child: CircularProgressIndicator(

                        ),
                      );
                    }
                  },
                ),
              )   ,
                    //TODO Payment
                    SizedBox(height: 40,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment Method",style: TextStyle(

                          fontSize: 16,
                        ),),

                      ],
                    ),
                    Divider(),

                    Container(
                      padding: EdgeInsets.only(left: 15,top: 10,bottom: 30),
                      margin: EdgeInsets.only(top: 5),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text("Please select your method of payment",style: TextStyle(
                          //
                          //   fontSize: 12.8,
                          // ),),
                          SizedBox(height: 20,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                //TODO by Cash
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    initpayment  = 0;

                                  });
                                },
                                child: Container(

                                  decoration: BoxDecoration(
                                    color:

                                    selectedmethod == initpayment?
                                        Color(AppColorConfig.success) :
                                    Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  alignment: Alignment.center,
                                  width: 121.08,
                                  height: 89,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/logo/Money icon.png',

                                      width: 50,
                                          height: 50,
                                      ),
                                      Text('Cash',style: TextStyle(
                                        color:
                                        initpayment == 0?
                                        Colors.white :

                                          Color(AppColorConfig.success)
                                      ),)

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              //TODO by payment method
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    initpayment = 1;

                                  });
                                },
                                child: Container(

                                  decoration: BoxDecoration(
                                      color:
                                      initpayment == 1?
                                      Color(AppColorConfig.success) :
                                      Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  alignment: Alignment.center,
                                  width: 121.08,
                                  height: 89,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/logo/Credit Card Icon.png',

                                        width: 50,
                                        height: 50,
                                      color:


                                      initpayment == 1?
                                      Colors.white:
                                      Colors.black,

                                      ),
                                      Text('MasterCard ',style: TextStyle(
                                        color:
                                        initpayment == 1?
                                        Colors.white:
                                        Colors.black,


                                      ),)

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5)
                      ),
                    ),
                    SizedBox(height: 40,),
                    //TODO Product Details

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Product Detail",style: TextStyle(

                          fontSize: 16,
                        ),),



                      ],
                    ),
                    Divider(),

                    //TODO product row

                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15,top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Product Qty',style: TextStyle(
                                color: Colors.grey
                              ),),
                              Text('x ${widget.qtytotal}'),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total ',style: TextStyle(
                                  color: Colors.grey
                              ),),
                              Text('\$ ${widget.subtotal}'),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Promotion Discount',style: TextStyle(
                                  color: Colors.grey
                              ),),
                              Text('${widget.discount}'),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(bottom: 135,top: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xffC2E5DF)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('SubTotal',style: TextStyle(
                                  color: Colors.black
                              ),),
                              Text('\$ ${widget.subtotal}'),
                            ],
                          ),
                        ),

                      ],
                    )
                  ],
                ),

              ],
            ),

          )
        ),
      );
  },
),
      bottomNavigationBar:      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(

          children: [
            Expanded(
              child: FloatingActionButton.extended(
                  backgroundColor: Color(AppColorConfig.success),

                  elevation: 0,
                  isExtended: true,
                  extendedPadding: EdgeInsets.all(0),

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                  ),
                  onPressed: () {
                    //TODO submit order
                    //TODO do some event

                    List<Productss>? item =[];

                    for(int index=0;index<cart!.length;index++) {
                      item.add(Productss(
                        id: cart![index].productid,
                        quantity:  cart![index].qty,
                        colorselection: cart![index].colorid,
                        size:  cart![index].sizeid,


                      ));
                    }
                    print("Item in cart");
                    print(item.length);
                    //TODO orderrequest
                    print(item);

                    print(widget.uid);
                    print(initpayment);

                    if(initpayment == 1) {
                      print("What is our init state");
                      double total = 0;
                      var qtytotal = 0;
                      cart!?.forEach((element) {
                        total += (element!.price * element.qty);
                        qtytotal += element!.qty!;

                      });
                      makePayment(currency:"USD",totalamount:total.ceil().toString()).then((value) {
                        print("Success");



                      }).catchError((err) {
                        print(err);

                      });

                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return TestScreen(currency: 'USD',total: total.ceil(),);
                        // },));

                    }
                    //

                    else{
                      OrderRequestV2 order = OrderRequestV2(

                          customer:widget.uid,

                          method:
                          initpayment == 0?
                          "Cash" :
                          "online",
                          products:item

                      );

                      BlocProvider.of<OrderBloc>(context,listen: false).add(PostOrderEvent( addressid:addressid ,orderRequestV2: order));
                    }




                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Success();
                    // },));

                  }, label:Text('Place Order',style: TextStyle(
                  fontSize: 12.8
              ),)),
            ),
          ],
        ),
      ),



    );
  }


  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var res = await http.
      post(Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer ${SecretKey.key}',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body
      );
      print("Payment body: ${res.body.toString()}");
      return json.decode(res.body);
    } catch (error) {
      print('  createPaymentIntentresponse error');
      print(error.toString());
    }
  }

  String calculateAmount(String amount) {
    return ((int.parse(amount)) * 100).toString();
  }

  Future<void> makePayment({totalamount,currency}) async {
    print("payment");
    try {
      paymentintent = await createPaymentIntent(totalamount.toString(), 'USD');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentintent!['client_secret'],
              style: ThemeMode.light,
              merchantDisplayName: 'Adnan')).then((value) {

      });
      // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92'),
      // googlePay: const PaymentSheetGooglePay(merchantCountryCode: )
      //after successfully paid
      displayPaymentSheet();
    } catch (err) {
      print('send response error');
      print(err.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet(

      ).then((value) {

        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text('Payment Successfully'),
          );
        },);
        paymentintent = null;
        context.read<OrderBloc>().add(OrderStripe());
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        print("error is --- ${error}");
      });
    } on StripeException catch (e) {
      print("Stripe error catching ${e}");
      await Stripe.instance.presentPaymentSheet(

      ).then((value) {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text('Error has been occur'),
          );
        },);
        paymentintent = null;
      }).onError((error, stackTrace) {
        print("error is --- ${error}");
      });
    }
  }
}


