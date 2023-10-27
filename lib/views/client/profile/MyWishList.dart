import 'package:ecommerce/viewmodel/products/product_fav_bloc.dart';
import 'package:ecommerce/views/client/product/MyProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/Product/ProductModel.dart';
import '../../../res/constant/appcolor.dart';
import '../../widget/Product/GridCardItem.dart';
import '../product/Product.dart';
import '../utilities/SearchPage.dart';

class MyWishScreen extends StatefulWidget {
  var uid;
  MyWishScreen({Key? key,this.uid}) : super(key: key);

  @override
  State<MyWishScreen> createState() => _MyWishScreenState();
}

class _MyWishScreenState extends State<MyWishScreen> {


  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }

  Widget build(BuildContext context) {
    print(widget.uid);
    context.read<ProductFavBloc>().add(ShowFavorite(widget.uid));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery
            .of(context)
            .size
            .width * 0.20,
        title: Text("My WishList", style: TextStyle(
            fontSize: 22,
            color: Colors.black
        ),),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close, color: Colors.black),
        ),


        // CircleAvatar(
        //   radius: 20,
        //   backgroundImage: NetworkImage('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80'),
        // ),
        backgroundColor: Colors.white.withOpacity(0.34),
        elevation: 0,

      ),
      body: SafeArea(

          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: BlocConsumer<ProductFavBloc, ProductFavState>(
              listener: (context, state) {
                // TODO: implement listener
                print(state);
              },
              builder: (context, state) {
                if(state is ProductfavLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is ProductfavDone){
                  var len = state.productFavModel?.results![0].products?.length;
                return ListView.builder(
                itemCount: len ?? 0,

                itemBuilder: (context, index) {
                  var product = state.productFavModel?.results![0].products![index];
                return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                side: BorderSide(
                color: Colors.grey.withOpacity(0.35)
                )
                ),
                child: ListTile(
                isThreeLine: true,
                onTap: () {
                  print(product.category);
                  print(product.productname);

                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return ProductDetailScreen(
                  //
                  //     productss: MyProductDetail(
                  //
                  //       id: product.id,
                  //     imgid: product.imgid,
                  //     price: product.price,
                  //     category: product.category,
                  //     attribution: product.attribution,
                  //     discount: product.discount,
                  //     avgRating: product.avgRating,
                  //     description: product.description,
                  //     sellRating: product.sellRating,
                  //     productname: product.productname,
                  //     stockqty: product.stockqty
                  //
                  //
                  //
                  //
                  //
                  //
                  //   )
                  //     ,);
                  // },));
                },
                style: ListTileStyle.drawer,
                contentPadding: EdgeInsets.all(14),

                leading: Image.network(
                '${product?.imgid![0].images}'),
                title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                Expanded(
                  child: Text('${product?.productname}', style: TextStyle(
                  fontSize: 16,
                    fontWeight: FontWeight.w400,

                    overflow: TextOverflow.ellipsis,


                  ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.orangeAccent,size: 19,),
                      Text('5 stars', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),),
                    ],
                  )

                // InkWell(
                // onTap: () {
                //
                // },
                // child: Icon(
                // Icons.delete, color: Color(0xffC73737),
                // size: 17,),
                // ),
                ],
                ),
                subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('\$ 55', style: TextStyle(
                fontSize: 15.9,
                fontWeight: FontWeight.w500,
                color: Color(AppColorConfig.success)
                ),),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text("${product?.sellRating} sold",style: TextStyle(
                    color: Color(AppColorConfig.negativecolor)
                  ),),
                  Container(





                      decoration: BoxDecoration(
                          color  :    Color(AppColorConfig.negativelight),
                          border: Border.all(color:  Color(AppColorConfig.negativecolor),
                              width: 1
                          )
                      ),
                      padding: EdgeInsets.all(3),
                      width: 43,




                      child: Text("${product!.discount} % ",style: TextStyle(

                        color: Color(AppColorConfig.negativecolor),
                        // backgroundColor:    Color(AppColorConfig.negativelight)
                      ),)),
                ],
                ),

                ],
                ),
                // trailing: ,
                ),

                );
                },);
                }
               if(state is ProductfavError){
                  return Center(
                    child:Text("Sth has error"),
                  );
                }
                else{
                return Center(
                  child: CircularProgressIndicator(),
                );
                }

              },
            ),
          )
      ),
    );
  }


}
