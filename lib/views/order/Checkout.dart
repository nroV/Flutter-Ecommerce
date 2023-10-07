
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/views/order/GoogleMap/GoogleMapScreen.dart';
import 'package:ecommerce/views/order/Success.dart';
import 'package:flutter/material.dart';

import '../widget/Product/FloatingAction.dart';

import 'package:location/location.dart';
class Checkout extends StatelessWidget {
  const  Checkout ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5,left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Toy and Me Cambodia",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 20,),
                //TODO list product
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.25,
                  child: ListView.builder(
                    itemCount: 2,
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
                          onTap: () {

                          },
                          child: InkWell(
                              onTap: () async {
                                var location = await Location().getLocation();
                                print("User current location");
                                print(location.longitude);
                                print(location.latitude);


                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return GoogleMapScreen(positionlong:     location.longitude,
                                        positionlat:    location.latitude,
                                        );

                                },));
                              },
                              child: Text('Edit')),
                        )
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 10,),
                    //TODO address

                    Container(
                      padding: EdgeInsets.all(10),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('My Home address',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),),
                          Text('Lorem ipsum dolor sit amet consectetur adipiscing'
                              ' elit Ut et massa mi. Aliquam in hendrerit.',style: TextStyle(
                            fontSize: 12.8,
                            color: Colors.grey
                          ),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5)
                      ),
                    ),
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
                      padding: EdgeInsets.only(left: 15,top: 30,bottom: 30),
                      margin: EdgeInsets.only(top: 15),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                //TODO by Cash
                          Container(

                            decoration: BoxDecoration(
                              color: Colors.white,
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
                                    height: 50,),
                                Text('Cash')

                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          //TODO by payment method
                          Container(

                            decoration: BoxDecoration(
                                color: Colors.black,
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
                                  height: 50,),
                                Text('MasterCard ',style: TextStyle(
                                  color: Colors.white
                                ),)

                              ],
                            ),
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
                                  color: Colors.grey
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
                                  color: Colors.grey
                              ),),
                              Text('50%'),
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
                              Text('\$ 25.24'),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton:CustomFLoating(title: 'Placed Order',)


    );
  }
}


