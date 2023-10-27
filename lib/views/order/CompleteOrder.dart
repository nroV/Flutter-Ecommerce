

import 'package:ecommerce/viewmodel/cart/cart_bloc.dart';
import 'package:ecommerce/viewmodel/order/order_bloc.dart';
import 'package:ecommerce/views/client/NavScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../res/appurl/appurl.dart';
import '../client/Review/ReviewPopUp.dart';
class CompletedOrder extends StatefulWidget {

  const CompletedOrder({Key? key}) : super(key: key);

  @override
  State<CompletedOrder> createState() => _CompletedOrderState();
}
void ReviewAlert(BuildContext context) {

  showDialog(context: context, builder: (context) {
    return AlertReviewPop();
  },);
}
class _CompletedOrderState extends State<CompletedOrder> {
  int subqty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(

        title: Text('Order Summary',style: TextStyle(
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
            child: BlocConsumer<OrderBloc, OrderState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is OrderDetailSuccess) {

      var cartlen = state.orderDetail?.products!.length ?? 0;
      var urlimg = ApiUrl.main;

      print(cartlen);
      return Column(
        children: [

          ListView.builder(

            itemCount: cartlen,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var cart =  state.orderDetail?.products;
              return Container(

                margin: EdgeInsets.only(bottom: 10),



                child: ListTile(
                  onTap: () {

                  },


                  contentPadding: EdgeInsets.all(0),
                  leading: Image.network('${urlimg}${cart![index].colorselection?.imgid?.images}'

                    ,fit: BoxFit.cover,
                    width: 100,
                    height:double.maxFinite,
                  ),

                  title: Text('${cart![index].product!.productname!}',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),),
                  subtitle: Text('\$ ${cart![index].product!.price!}',style: TextStyle(
                      fontSize: 16.8,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff508A7B)
                  ),),
                  trailing: Text('Qty: ${cart![index].quantity!}',style: TextStyle(
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order ${state.orderDetail?.id}",style: TextStyle(

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
                      for(int i =0;i<state.orderDetail!.products!.length;i++)
                      Text('x ${ ( subqty += state.orderDetail!.products![i].quantity!.toInt()  ) }'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Price',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.8
                      ),),
                      Text('\$ ${state?.orderDetail?.amount}'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payment',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.8
                      ),),
                      Text('${state.orderDetail?.method}'),
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
                      Text('\$ ${state?.orderDetail?.amount}'),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ],
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
                    BlocProvider.of<CartBloc>(context,listen: false).add(CartClear());
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                      return MyNavScreen();
                    },),(route) => false  );

                  }, label:Text('Continue Shopping',style: TextStyle(
                  fontSize: 12.8
              ),)),
            ),
          ],
        )
    );
  }
}
