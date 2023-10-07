import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/views/client/utilities/searchscreen.dart';
import 'package:flutter/material.dart';

import '../widget/Product/GridCardItem.dart';

class ProductAllPage extends StatefulWidget {
  var apptitle;
 ProductAllPage({Key? key,this.apptitle}) : super(key: key);

  @override
  State<ProductAllPage> createState() => _ProductAllPageState();
}

class _ProductAllPageState extends State<ProductAllPage> {
  @override

    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(

          title:Text("${widget.apptitle}",style: TextStyle(
              color: Colors.black
          ),),
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.14),
          centerTitle: true,

          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                    return  SearchScreen();
                  },));

                },

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ))
          ],

        ),
        body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //TODO sort section

                    ElevatedButton(
                        onPressed:() {

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.black.withOpacity(0.06)
                                )
                            ),


                            padding: EdgeInsets.only(top: 1.7,bottom: 1.7,left: 70,right: 70)
                        ),


                        child: Column(
                          children: [
                            Icon(Icons.sort,
                              color: Colors.grey,
                            ),
                            Text("Sort By",style: TextStyle(
                                fontSize: 12.8,
                                color: Colors.grey
                            ),)
                          ],
                        )

                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                        onPressed:() {

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.black.withOpacity(0.06)
                                )
                            ),


                            padding: EdgeInsets.only(top: 1.7,bottom: 1.7,left: 70,right: 70)
                        ),


                        child: Column(
                          children: [
                            Icon(Icons.filter_list,
                              color: Colors.grey,
                            ),
                            Text("Filter",style: TextStyle(
                                fontSize: 12.8,
                                color: Colors.grey
                            ),)
                          ],
                        )

                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text("10 Products Found",style: TextStyle(
                  fontSize: 12.8,
                  color: Colors.black,
                  fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 10,),
                Expanded(

                  child: GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),


                    itemCount: 10,
                    scrollDirection: Axis.vertical,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 280,


                        childAspectRatio: 19 / 12,



                        mainAxisSpacing: 5

                    ),
                    itemBuilder:(context, index) {
                      return Container(
                        height: 300,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Stack(
                                children: [
                                  Image.network('https://images.unsplash.com/photo-1499013819532-e4ff41b00669?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2080&q=80'),
                                  Positioned(
                                    top: 5,
                                    right: 0,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star,size: 20,color: Colors.amberAccent,),
                                          Text("4.5",style: TextStyle(

                                          ),)
                                        ],
                                      ),
                                    ),
                                  )

                                ],


                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(





                                      decoration: BoxDecoration(
                                          color  :    Color(AppColorConfig.negativelight),
                                          border: Border.all(color:  Color(AppColorConfig.negativecolor),
                                              width: 1
                                          )
                                      ),
                                      padding: EdgeInsets.all(4),
                                      width: 70,




                                      child: Text("50% OFF",style: TextStyle(

                                        color: Color(AppColorConfig.negativecolor),
                                        // backgroundColor:    Color(AppColorConfig.negativelight)
                                      ),)),
                                  Text("100+ sold",style: TextStyle(
                                      fontSize: 12.8,
                                      color: Color(AppColorConfig.success)
                                  ),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8,top: 9),
                                child: Text("Air Jordan 1",style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),),
                              ),
                              Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("\$10.99",style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20

                                    ),),



                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(right: 10),

                                      decoration: BoxDecoration(

                                        shape: BoxShape.circle,

                                      ),
                                      child: CircleAvatar(
                                        backgroundColor:      Color(AppColorConfig.success),
                                        radius: 12,


                                        child: Image.asset('assets/logo/shopping-cart.png',fit: BoxFit.cover,
                                          width: 14,
                                          height: 14,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },

                  ),
                ),

              ],
            ),
          )
        ),
      );
    }
}
