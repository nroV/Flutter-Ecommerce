import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/order/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/Order/OrderResponse.dart';
import 'CompleteOrder.dart';

class Success extends StatefulWidget {
  OrderReponse? order;

  Success({Key? key,this.order}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(

          title: Text('Order Completed', style: TextStyle(
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
          child: Column(
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

        floatingActionButton: Row(

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

              BlocProvider.of<OrderBloc>(context,listen: false).add(GetOrderDetail(orderid: widget.order?.id));
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context) {
                return CompletedOrder();
              },),(route) => false,);
            },
            label: Text('Continue', style: TextStyle(
                fontSize: 12.8
            ),)),
    )
          ],
        )
    );
  }
}
