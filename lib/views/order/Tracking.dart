

import 'package:ecommerce/views/client/NavScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class TrackingScreen extends StatelessWidget {
  var appbar;
 TrackingScreen({Key? key,this.appbar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(

          title: Text('${appbar ?? 'Tracking'}',style: TextStyle(
              color: Colors.black
          ),),
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          backgroundColor: Colors.white.withOpacity(0.34),
          elevation: 0,


        ),
        body:SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [



                  Container(


                    child:Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery Status",style: TextStyle(

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


                                      ),
                                      SizedBox(height: 10,),
                                      Text('Completed',style: TextStyle(
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
                                          backgroundColor: Color(0xffD9D9D9)
                                      ),
                                      SizedBox(height: 10,),
                                      Text('Delivering',style: TextStyle(
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
                                    backgroundColor: Color(0xffD9D9D9)
                                ),
                                SizedBox(height: 10,),
                                Text('Completed',style: TextStyle(
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
                        Text("Order #233",style: TextStyle(

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
                              Icon(Icons.add_ic_call_sharp,size: 15,),
                              SizedBox(width: 10,),
                              Icon(Icons.email,size: 15,),
                            ],
                          ),)



                      ],
                    ),
                  ),
                  Divider(),
                  ListView.builder(
                    itemCount: 2,
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(

                        margin: EdgeInsets.only(bottom: 10),



                        child: ListTile(
                          onTap: () {

                          },


                          contentPadding: EdgeInsets.all(0),
                          leading: Image.network('https://images.unsplash.com/photo-1499013819532-e4ff41b00669?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2080&q=80'

                            ,fit: BoxFit.cover,
                            width: 100,
                            height:double.maxFinite,
                          ),

                          title: Text('Air Jordan 1',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),),
                          subtitle: Text('\$ 18.99',style: TextStyle(
                              fontSize: 16.8,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff508A7B)
                          ),),
                          trailing: Text('Qty: 3',style: TextStyle(
                              fontSize: 12.8,

                              fontWeight: FontWeight.w400
                          ),),

                        ),
                      );
                    },),
                  Container(
                    height: 300,

                    child:Column(
                      children: [

                        //TODO product summary
                        Container(
                          margin: EdgeInsets.only(bottom: 15,top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Product Qty',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.8
                              ),),
                              Text('x2'),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Product Price',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.8
                              ),),
                              Text('\$50.60'),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Promotion Discount',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.8
                              ),),
                              Text('50%'),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(bottom: 0,top: 10),
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
                              Text('\$ 25.24'),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
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
