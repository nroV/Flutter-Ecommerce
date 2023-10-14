import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/order/order_bloc.dart';
import 'package:ecommerce/views/order/Tracking.dart';
import 'package:ecommerce/views/widget/other/EmptyWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class OrderHistory extends StatefulWidget {
   OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendorderuser();
  }
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(

          title: Text("Order History", style: TextStyle(
              color: Colors.black
          ),),
          iconTheme: IconThemeData(
              color: Colors.black
          ),

          backgroundColor: Colors.white,
          elevation: 0),
      body: SafeArea(

        child: BlocConsumer<OrderBloc, OrderState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is OrderUserLoading){
              return Center(
                child: CircularProgressIndicator(),
              );

            }
            if(state is OrderUserComplete){
              return
                state.orderDetail?.results?.length! != 0   ?
          SizedBox.expand(
                child: ListView.builder(
                  itemCount: state.orderDetail?.results?.length ?? 0,



                  itemBuilder: (context, index) {
                    var order =  state.orderDetail?.results?[index];
                    var orderdate =DateFormat('dd-MM-yyyy kk:mm').format( DateTime.parse(state.orderDetail!.results![index].shippedAt.toString()));
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) {
                            return TrackingScreen(appbar: 'Tracking',orderid: order.id,);
                          },));
                      },
                      child: Card(
                          elevation:1,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(



                                title: Text('Order No # ${order!.id}'),
                                subtitle: Text(
                                  '${order?.address?.street}',
                                  style: TextStyle(
                                      fontSize: 10.8
                                  ),),
                                // trailing: ,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text('Payment by ${order!.method}',
                                            style: TextStyle(
                                                fontSize: 12.8,
                                                color: Colors.grey
                                            ),

                                          ),
                                          Text('Total : \$ ${order!.amount}')

                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text('Order Date ${orderdate}',


                                          style: TextStyle(
                                              fontSize: 12.8,
                                              color: Colors.grey
                                          ),),
                                        Container(
                                          width: 98,
                                          height: 26,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color:
                                              order.status!.toLowerCase() =="pending" ?
                                              Color(AppColorConfig.negativelight) :
                                              Color(0xffC2E5DF),
                                              borderRadius: BorderRadius.circular(
                                                  6)
                                          ),
                                          child: Text(
                                            "${order.status}", style: TextStyle(
                                              fontSize: 12.8,
                                              color:
                                              order.status!.toLowerCase() =="pending" ?
                                              Color(AppColorConfig.negativecolor) :
                                              Color(AppColorConfig.success),
                                              fontWeight: FontWeight.w500
                                          ),),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),


                            ],
                          )

                      ),
                    );
                  },),
              ) :

      EmptyCard(
                maintitle: 'No History Yet',

                subtitle: 'You haven\'t make any order yet' ,
                img: 'assets/logo/.png',
                btntitle: 'Explore Our Product',

              );
              ;
            }
            if(state is OrderUserError){
              return Center(
                child: Text("Error occur"),
              );
            }

            else{
              return Center(
                child: Text("Error occur"),
              );
            }

          },
        ),
      ),


    );
  }

  void sendorderuser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getInt("userid");
      BlocProvider.of<OrderBloc>(context,listen: false).add(GetUserorder(userid:  prefs.getInt("userid")));
  }
}
