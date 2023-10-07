

import 'package:ecommerce/views/order/Tracking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title:Text("Order History",style: TextStyle(
              color: Colors.black
          ),),
          iconTheme: IconThemeData(
              color: Colors.black
          ),

          backgroundColor: Colors.white.withOpacity(0.34),
          elevation: 0),
      body: SafeArea(
        child: SizedBox.expand(
          child: ListView.builder(
            itemCount: 12,

            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                      return TrackingScreen(appbar: 'Tracking',);
                  },));

                },
                child: Card(
                  elevation: 0,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(




                        leading: Image.network('https://www.socialstarters.org/wp-content/uploads/2019/03/good-market-vendor-logo.png'

                          ,fit: BoxFit.cover,
                        ),
                        title:  Text('The Safe Green Vendor'),
                        subtitle:      Text('Street 148, Corner 257, Sangkat Toultompong 2 Khan Chamkamon , Phnom Penh',style: TextStyle(
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Order No #12',
                                  style: TextStyle(
                                    fontSize: 12.8,
                                    color: Colors.grey
                                  ),

                                  ),
                                  Text('Total : \$120.00')

                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Order Date 26-09-2023 12:00PM',


                                  style: TextStyle(
                                      fontSize: 12.8,
                                      color: Colors.grey
                                  ),),
                                Container(
                                  width:98,
                                  height: 26,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xffC2E5DF),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Text("Completed",style: TextStyle(
                                      fontSize:12.8,
                                      color: Color(0xff1C3A2E),
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
      ),


    );
  }
}
