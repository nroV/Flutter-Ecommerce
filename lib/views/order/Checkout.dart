
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/products/address_bloc.dart';
import 'package:ecommerce/views/order/GoogleMap/GoogleMapScreen.dart';
import 'package:ecommerce/views/order/Success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/Order/OrderRequest.dart';
import '../../model/Product/CartModel.dart';
import '../../viewmodel/order/order_bloc.dart';
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

 var address;
 var selectedIndexAddress = 0;
 var indexchose =0;
 var initpayment = 0;
 var selectedmethod = 0;
  int? addressid;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    print("Checkout userid");
    print(widget.uid);

    // BlocProvider.of<AddressBloc>(context).add(FetchAddress(userid: widget!.uid));
  }
  Widget build(BuildContext context) {
    BlocProvider.of<AddressBloc>(context).add(FetchAddress(userid: widget.uid));
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

                          fontSize: 16,
                        ),),
                        InkWell(
                          onTap: () async {
                            var location = await Location().getLocation();
                            print("User current location");
                            print(location.longitude);
                            print(location.latitude);


                            address = await Navigator.push(
                                context, MaterialPageRoute(builder: (context) {
                              return GoogleMapScreen(positionlong: location.longitude,
                                positionlat: location.latitude,
                              );
                            },));

                            setState(() {
                              print("Got Address back");
                              print(address);
                            });
                          },

                          child: Row(
                            children: [
                              Icon(Icons.add_circle_rounded),
                              SizedBox(width: 7,),
                              Text("Add new Address ", style: TextStyle(

                                fontSize: 12.8,

                              ),),
                            ],
                          ),
                        ),
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
                height: 180,

                child: BlocConsumer<AddressBloc, AddressState>(
                  listener: (context, state) {
                    // TODO: implement listener
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
                      return     state.add?.results?.length  == 0?


                      Center(
                        child: Text("You have no address yet"
                          ,style: TextStyle(
                              color: Colors.grey,
                            fontSize: 12.8
                          ),),
                      )  :
                     ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.add?.results?.length ,

                        itemBuilder: (context, index) {
                          addressid =   state.add?.results?[selectedIndexAddress].id;
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
                                width: 200,

                                margin: EdgeInsets.only(bottom: 10,right: 10),

                                padding: EdgeInsets.only(
                                    top: 35, bottom: 35, left: 15, right: 15),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text('${
                                            selectedIndexAddress == index ?
                                                'Selected Address' :
                                            state.add?.results![index].description


                                        }', style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                        ),),



                                        InkWell(
                                          onTap: () {

                                          },
                                          child: InkWell(
                                              onTap: () async {
                                                var location = await Location()
                                                    .getLocation();
                                                print("User current location");
                                                print(location.longitude);
                                                print(location.latitude);


                                                address = await Navigator.push(context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return GoogleMapScreen(
                                                          positionlong: location
                                                              .longitude,
                                                          positionlat: location
                                                              .latitude,
                                                        );
                                                      },));

                                                setState(() {
                                                  print("Got Address back");
                                                  print(address);
                                                });
                                              },
                                              child: Text('Edit', style: TextStyle(
                                                  fontSize: 10.8,
                                                color: Color(AppColorConfig.success)
                                              ),)),
                                        )
                                      ],
                                    ),

                                    SizedBox(height: 10,),

                                    Text('${state.add?.results![index].street}', style: TextStyle(
                                        fontSize: 11.8,
                                        color: Colors.grey
                                    ),)


                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:


                                    selectedIndexAddress == index ?
                                    Color(AppColorConfig.success) :
                                    Colors.white
                                  ),


                                    color:

                                    selectedIndexAddress == index ?
                                        Colors.white :

                                    Color(0xffF5F5F5)
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

                    OrderRequestV2 order = OrderRequestV2(

                        customer:widget.uid,

                        method:
                        initpayment == 0?
                        "Cash" :
                        "online",
                        products:item

                    );

                    BlocProvider.of<OrderBloc>(context,listen: false).add(PostOrderEvent( addressid:addressid ,orderRequestV2: order));


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
}


