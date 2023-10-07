
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'CompleteOrder.dart';

class Success extends StatelessWidget {
  const  Success ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(

        title: Text('Order Completed',style: TextStyle(
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
        child:Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Center(
              child: Lottie.asset('assets/lotties/animation_ln8qhtiz.json',
              fit: BoxFit.cover,
                width: 266,
                height: 266
              ),
            ),
            Center(child: Text("Your Order has been placed")),
          ],
     
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        floatingActionButton:Row(

          children: [
            Expanded(
              child: FloatingActionButton.extended(
                  backgroundColor: Colors.black,

                  elevation: 0,
                  isExtended: true,
                  extendedPadding: EdgeInsets.all(0),

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return  CompletedOrder();
                    },));

                  }, label:Text('Continue',style: TextStyle(
                  fontSize: 12.8
              ),)),
            ),
          ],
        )
    );
  }
}
