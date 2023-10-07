import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../res/constant/appcolor.dart';
import '../../../viewmodel/products/product_bloc.dart';
import '../../widget/Product/GridCardItem.dart';
import '../product/Product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var txtsearch = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<ProductSearchBloc>(context,listen: false);
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: Container(
          alignment: Alignment.center,
          height: 40,

          child: TextField(
            style: TextStyle(

                fontSize: 13
            ),
            controller: txtsearch,

            onSubmitted: (value) {
              setState(() {
                txtsearch.text = value;
              });
              print("Search event send");
            BlocProvider.of<ProductSearchBloc>(context,listen: false).add(QueryProduct(txtsearch.text));
              print(txtsearch.text);
            },

            onTap: () {
              setState(() {

              });
            },
            decoration: InputDecoration(
                filled: true,

                fillColor: Color(AppColorConfig.bgfill),
                hintText: 'What are you looking for',
                contentPadding: EdgeInsets.only(left: 24),

                floatingLabelStyle: TextStyle(
                    color: Colors.black
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)
                )
            ),

          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.14),
        centerTitle: true,

        actions: [
          InkWell(
            onTap: () =>   BlocProvider.of<ProductSearchBloc>(context,listen: false).add(QueryProduct(txtsearch.text)),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 5),
              child: Text("Search", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.8
              )),
            ),
          )
        ],

      ),
      body: SafeArea(
          child: BlocConsumer<ProductSearchBloc, ProductState>(


            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is ProductInitialSearch) {
                return Center(
                  child: Text("No item found"),
                );
              }
              if(state is ProductSearchLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is ProductSerachCompleted) {
                var productlen = state.product!.results!.length;
                print(productlen);
                return
                  productlen != 0  ?


                            Expanded(

                  child: GridView.builder(




                    itemCount: productlen ?? 0,
                    scrollDirection: Axis.vertical,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 280,


                        childAspectRatio: 19 / 12,


                        mainAxisSpacing: 5

                    ),
                    itemBuilder: (context, index) {
                      var product =  state.product!.results![index];
                      return Container(
                        height: 430,
                        child: Card(
                          elevation: 0,


                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return ProductDetailScreen(product:product,);
                              },));
                            },
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Stack(
                                  children: [

                                    Image.network('${product!.imgid![0].images} ',fit: BoxFit.contain,
                                      width: double.maxFinite,
                                      height: 180,



                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 0,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star, size: 20,
                                              color: Colors.amberAccent,),
                                            Text("${product.avgRating}", style: TextStyle(

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
                                    if(product.discount !=0 )
                                      Container(


                                          decoration: BoxDecoration(
                                              color: Color(
                                                  AppColorConfig.negativelight),
                                              border: Border.all(color: Color(
                                                  AppColorConfig.negativecolor),
                                                  width: 1
                                              )
                                          ),
                                          padding: EdgeInsets.all(4),
                                          width: 70,


                                          child:

                                          Text("${product.discount } % ", style: TextStyle(


                                              color: Color(
                                                  AppColorConfig.negativecolor),
                                              fontSize: 12.8
                                            // backgroundColor:    Color(AppColorConfig.negativelight)
                                          ),)),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text("${product.sellRating} sold", style: TextStyle(
                                          fontSize: 12.8,
                                          color: Color(AppColorConfig.success)
                                      ),),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 9),
                                  child: Text("${product.productname}", style: TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  padding: const EdgeInsets.only(left: 8,),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text("\$ ${product.price}", style: TextStyle(
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
                                          backgroundColor: Color(
                                              AppColorConfig.success),
                                          radius: 12,


                                          child: Image.asset(
                                            'assets/logo/shopping-cart.png',
                                            fit: BoxFit.cover,
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
                        ),
                      );
                    },

                  ),
                ) :      Center(
              child: Text("No item found"),
              ) ;
              }
              else{
                return Center(
                  child: Text("Error"),
                );
              }

            },
          )
      ),
    );
  }
}
