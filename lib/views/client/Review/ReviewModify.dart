import 'package:ecommerce/model/Product/CartModel.dart';
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/Review/review_bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/Category/ProductCategory.dart';
import '../../../model/Product/ProductModel.dart';
import '../../../model/Review/ReviewModel.dart';
import '../../../viewmodel/cart/cart_bloc.dart';
import '../../order/Cart.dart';
import '../../order/Checkout.dart';
import '../Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../NavScreen.dart';
import 'Review.dart';


class ReviewModify extends StatefulWidget {
  var pid;
  var productname;
  var productimage;

  ReviewModify({this.pid, this.productname, this.productimage});

  @override
  State<ReviewModify> createState() => _ReviewModifyState();
}

class _ReviewModifyState extends State<ReviewModify> {
  var product;
  var txtdesc = TextEditingController();

  var starlist = [0, 1, 2, 3, 4];
  var isselectstar = [false, false, false, false, false];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.pid);
    print(widget.productname);
  }

  void PopUpUnauthorize(BuildContext context,String? message) {

    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Error",style: TextStyle(
            fontSize: 18,
            color: Color(AppColorConfig.negativecolor)
        ),),
        content: Text("${message}",style: TextStyle(
            fontSize: 12.8,
            fontWeight: FontWeight.w400,

            color: Colors.black
        ),),
        elevation: 0,
        actions: [
          ElevatedButton(

              onPressed: () {

                Navigator.pop(context);


              },
              style: ElevatedButton.styleFrom(
                  backgroundColor:Color(AppColorConfig.negativecolor),
                  elevation: 0,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black.withOpacity(0.14)),
                      borderRadius: BorderRadius.circular(3)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(width: 10,),
                  Text("Dismiss",style: TextStyle(
                    fontSize: 12.8,

                  ),)
                ],
              ))
        ],
      );
    },);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

          title: Text("Write a Review", style: TextStyle(
              color: Colors.black
          ),),
          centerTitle: true,
          titleSpacing: 0,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          // centerTitle: true,
          backgroundColor: Colors.white,

          elevation: 0),
      body: SafeArea(
        child: BlocListener<ReviewBloc, ReviewState>(
          listener: (context, state) {
            // TODO: implement listener}
            print(state);
            
            if(state is ReviewPostLoading) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is ReviewPostCompleted) {
              context.read<ReviewBloc>().add(ReviewFetch(pid: widget.pid  ));
              Navigator.pop(context);

            }
            if(state is ReviewPostErrorMessage) {
              context.read<ReviewBloc>().add(ReviewFetch(pid: widget.pid  ));
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  PopUpUnauthorize(context,state.message);
                });
              context.read<ReviewBloc>().add(ReviewFetch(pid: widget.pid  ));
            }
          },
          child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.09)
                    ),
                    child: ListTile(


                      contentPadding: EdgeInsets.all(0),
                      leading: Image.network('${widget.productimage}'),

                      title: Text("${widget.productname}"),


                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Rating", style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 10,),
                  Text("On a scale from 1 to 5 do your recommend this?",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.8
                    ),),
                  SizedBox(height: 20,),
                  Row(
                    children: starlist.map((e) {
                      return InkWell(
                          onTap: () {
                            print(e);
                            setState(() {
                              isselectstar[e] = !isselectstar[e];
                            });
                          },


                          child: Icon(Icons.star, color:
                          isselectstar[e] == true ?
                          Colors.orange :

                          Colors.grey,));
                    }).toList(),
                  ),

                  SizedBox(height: 20,),

                  Text("Product Review", style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 10,),

                  TextFormField(

                    cursorColor: Colors.grey,
                    style: TextStyle(
                        fontSize: 12.8,
                        color: Colors.black
                    ),

                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: 4,
                    controller: txtdesc,
                    onSaved: (newValue) {
                      setState(() {
                        txtdesc.text = newValue.toString();
                      });
                    },


                    decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.03),
                        filled: true,
                        hintText: "Your opinion about this product",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(

                              color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(4),

                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3)
                            )

                        )
                    ),
                  )
                ],
              )
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),

        decoration: BoxDecoration(

        ),

        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Expanded(
                child: ElevatedButton(

                    onPressed: () async {
                      var starpoint = isselectstar.map((e) => e == true)
                          .toList();

                      var starp = [];
                      starpoint.forEach((element) {
                        if (element == true) {
                          starp.add(element);
                        }
                      });


                      var ratingpoint = starp.length;
                      print("Rating star is ${ratingpoint}");
                      SharedPreferences prefs = await SharedPreferences
                          .getInstance();
                      var userid = prefs.getInt("userid");
                      print(userid);
                      print(txtdesc.text);
                      print(widget.pid);
                      context.read<ReviewBloc>().add(ReviewPost(
                          pid: widget.pid,
                          uid: userid,
                          desc: txtdesc.text,
                          rating: ratingpoint

                      ));

                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //
                      // },));


                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(AppColorConfig.success),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black.withOpacity(0.14)),
                            borderRadius: BorderRadius.circular(3)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit_sharp, size: 20,),
                        SizedBox(width: 5,),
                        Text("Submit Review", style: TextStyle(
                            fontSize: 12.8
                        ),)

                      ],
                    )),
              ),
            ]
        ),
      ),
    );
  }
}

