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

import '../../model/Order/OrderUser.dart';

class OrderHistory extends StatefulWidget {
   OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory>  with TickerProviderStateMixin{
  var init =0;
  var tabindex = 0;
  TabController? _vcontroller;


  List<Results>? history;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _vcontroller = TabController(
        initialIndex: 0,
        vsync: this, length: 3);
  }

  Widget build(BuildContext context) {
    sendorderuser();
    print("tab bar render");
    return DefaultTabController(
      length: 3,
      initialIndex: init,
      child: Scaffold(


        backgroundColor: Colors.white,
        appBar: AppBar(

            title: Text("Order History", style: TextStyle(
                color: Colors.black
            ),),
            iconTheme: IconThemeData(
                color: Colors.black
            ),
            bottom: TabBar(

              onTap: (value) {

                print(value);
                setState(() {
                  tabindex = value;
                });

              },
              controller: _vcontroller,
              labelStyle: TextStyle(
                  fontSize: 14.8,
                color: Colors.black
              ),

              padding: EdgeInsets.all(5),
                indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,

              indicatorColor:Color(AppColorConfig.success),


              indicator: UnderlineTabIndicator(

                  borderSide: BorderSide(width:3.0,color:Color(AppColorConfig.success), ),


                  insets: EdgeInsets.symmetric(horizontal:16.0),

              ),
              labelColor: Colors.black,

              unselectedLabelStyle: TextStyle(
                fontSize: 12.8,
                color: Colors.grey
              ),
              unselectedLabelColor: Colors.black,

              tabs: [
                Tab(
                  text: 'Pending',



                ),
                Tab(
                  text: 'Delivering',


                ),
                Tab(
                  text: 'Completed',


                ),
              ],
            ),

            backgroundColor: Colors.white,
            elevation: 0),
        body: SafeArea(

          child: TabBarView(


            children: [
              BlocConsumer<OrderBloc, OrderState>(
                listener: (context, state) {
                  // TODO: implement listener
                  print(state);
                },
                builder: (context, state) {


                  if(state is OrderUserLoading){
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  }
                  if(state is OrderUserComplete){

                     List<Results>? results =[] ;
                    if(tabindex == 0){

                      print("Tab index is 0");
                      state.orderDetail?.results!.forEach((element) {
                        if(element.status!.toLowerCase() == "pending") {
                          results!.add(element);
                        }
                      });
                    }
                    else if(tabindex == 1){
                      results!.clear();
                      state.orderDetail?.results!.forEach((element) {
                        if(element.status!.toLowerCase() == "delivering") {
                          results.add(element);
                        }
                      });
                      print("Tab index is 1");
                    }
                    else {
                      results!.clear();
                      print("Tab index is 2");
                      state.orderDetail?.results!.forEach((element) {
                        if(element.status!.toLowerCase() == "completed") {
                          results.add(element);
                        }
                      });
                    }

                    print(results.length);
                    return
                      results.length! != 0   ?
                      SizedBox.expand(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListView.builder(
                            itemCount: results.length ?? 0,



                            itemBuilder: (context, index) {

                              var order =  results[index];
                              // var order = history[index];
                              var orderdate =DateFormat('dd-MM-yyyy kk:mm').format( DateTime.parse(order!.shippedAt.toString()));
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) {
                                      return TrackingScreen(appbar: 'Tracking',orderid: order.id,);
                                    },));
                                },
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.withOpacity(0.4)
                                        )
                                    ),


                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          style: ListTileStyle.list,
                                          tileColor:
                                          order!.status!.toLowerCase() =="pending" ?
                                          Color(AppColorConfig.negativecolor) :


                                          order!.status!.toLowerCase() =="delivering" ?

                                          Colors.blueGrey:
                                          Color(AppColorConfig.success),





                                          title: Text('Order No # ${order!.id}',
                                            style: TextStyle(
                                                fontSize: 16.8,
                                                color: Colors.white
                                            ),


                                          ),
                                          subtitle: Text(
                                            '${order?.address?.street}',
                                            style: TextStyle(
                                                fontSize: 10.8,
                                                color: Colors.white
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
                                                    Text('Payment method ${order!.method}',
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
                                                        order.status!.toLowerCase() =="delivering" ?
                                                        Colors.blueGrey:
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

                                                        order.status!.toLowerCase() =="delivering" ?
                                                            Colors.white:
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
                        ),
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
                      child: CircularProgressIndicator(),
                    );
                  }

                },
              ),
            ],


          ),
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
