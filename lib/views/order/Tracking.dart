import 'package:ecommerce/res/appurl/appurl.dart';
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/order/order_bloc.dart';
import 'package:ecommerce/views/order/Tracking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import 'package:ecommerce/views/client/NavScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class TrackingScreen extends StatefulWidget {
  var appbar;
  var orderid;

  TrackingScreen({Key? key, this.appbar,this.orderid}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  int? totalqty = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<OrderBlocUser>(context,listen: false).add(GetOrderDetail(orderid: widget.orderid));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('${widget.appbar ?? 'Tracking'}', style: TextStyle(
            color: Colors.black
        ),),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        backgroundColor: Colors.white.withOpacity(0.34),
        elevation: 0,


      ),
      body: SafeArea(
        child: BlocConsumer<OrderBlocUser, OrderState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is OrderDetailSuccess) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [


              Container(


                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery Status", style: TextStyle(

                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),),


                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    //TODO tracking line order here
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(

                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:

                                    state?.orderDetail?.status!.toLowerCase() == "pending" ?
                                    Colors.green :
                                    Color(0xffD9D9D9)
                                    ,


                                  ),
                                  SizedBox(height: 10,),
                                  Text('Pending', style: TextStyle(
                                      fontSize: 12.8
                                  ),)
                                ],
                              ),
                              Expanded(
                                child: Container(


                                  child: Divider(


                                    color:

                                    Colors.grey,
                                    thickness: 1,
                                    height: 3,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),


                        Expanded(
                          child: Row(

                            children: [
                              Column(
                                children: [
                                  CircleAvatar(

                                      backgroundColor:
                                state?.orderDetail?.status!.toLowerCase() == "delivering" ?
                                Colors.green :

                                 Color(0xffD9D9D9)

                                  ),
                                  SizedBox(height: 10,),
                                  Text('Delivering', style: TextStyle(
                                      fontSize: 12.8
                                  ),)
                                ],
                              ),
                              Expanded(
                                child: Container(


                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    height: 3,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                        Column(
                          children: [
                            CircleAvatar(
                                backgroundColor:

                                state?.orderDetail?.status == "Completed" ?
                                Colors.green :

                                Color(0xffD9D9D9)
                            ),
                            SizedBox(height: 10,),
                            Text('Completed', style: TextStyle(
                                fontSize: 12.8
                            ),)
                          ],
                        ),


                      ],
                    ),
                    SizedBox(height: 20,),


                  ],
                ),
              ),
              Lottie.asset('assets/lotties/animation_ln8xphws.json'),
              Divider(),

              //TODO orde detail here
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order #${widget.orderid}", style: TextStyle(

                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),),

                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),

                      ),
                      child: Row(
                        children: [
                          Text('Need Help?'),
                          SizedBox(width: 20,),
                          Icon(Icons.add_ic_call_sharp, size: 15,),
                          SizedBox(width: 10,),
                          Icon(Icons.email, size: 15,),
                        ],
                      ),)


                  ],
                ),
              ),
              Divider(),

              ListView.builder(
                itemCount: state.orderDetail?.products?.length ?? 0,
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var order= state.orderDetail?.products![index];

                  totalqty = totalqty! + order!.quantity!;
                  return Container(

                    margin: EdgeInsets.only(bottom: 10),


                    child: ListTile(
                      onTap: () {

                      },


                      contentPadding: EdgeInsets.all(0),
                      leading: Image.network(
                        '${ApiUrl.main}${order.product?.imgid![0].images}'

                        , fit: BoxFit.cover,
                        width: 100,
                        height: double.maxFinite,
                      ),

                      title: Text('${order?.product?.productname}', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                      subtitle: Text('\$ ${order?.product?.price}', style: TextStyle(
                          fontSize: 16.8,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff508A7B)
                      ),),
                      trailing: Text('Qty: ${order?.quantity}', style: TextStyle(
                          fontSize: 12.8,

                          fontWeight: FontWeight.w400
                      ),),

                    ),
                  );
                },),
              Container(
                height: 300,

                child: Column(
                  children: [

                    //TODO product summary
                    Container(
                      margin: EdgeInsets.only(bottom: 15, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment Method', style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.8
                          ),),
                          Text('${state.orderDetail?.method}'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Price', style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.8
                          ),),
                          Text('\$ ${state.orderDetail?.amount}'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Promotion Discount', style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.8
                          ),),
                          Text('0%'),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.only(bottom: 0, top: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffC2E5DF)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SubTotal', style: TextStyle(
                              color: Colors.black
                          ),),
                          Text('\$ ${state.orderDetail?.amount}'),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      );

    }
    if(state is OrderDetailError){
      return Center(
        child:  Text('Error during server sending'),
      );
    }
    if(state is OrderDetailLoading){
      return Center(
        child:  CircularProgressIndicator(),
      );
    }
    else{
      return Center(
        child:  CircularProgressIndicator(),
      );
    }


  },
),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //
      // floatingActionButton:Row(
      //
      //   children: [
      //     Expanded(
      //       child: FloatingActionButton.extended(
      //           backgroundColor: Colors.black,
      //
      //           elevation: 0,
      //           isExtended: true,
      //           extendedPadding: EdgeInsets.all(0),
      //
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(0)
      //           ),
      //           onPressed: () {
      //             Navigator.push(context, MaterialPageRoute(builder: (context) {
      //               return MyNavScreen();
      //             },));
      //
      //           }, label:Text('Return',style: TextStyle(
      //           fontSize: 12.8
      //       ),)),
      //     ),
      //   ],
      // )
    );
  }
}
