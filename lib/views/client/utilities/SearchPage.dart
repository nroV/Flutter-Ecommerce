import 'package:ecommerce/views/client/utilities/searchscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../res/constant/appcolor.dart';
import '../../../viewmodel/products/product_bloc.dart';
import '../../widget/Product/GridCardItem.dart';
import '../product/Product.dart';

class SearchPage extends StatefulWidget {


  var focus;
  var titlesearch;
  SearchPage({Key? key,this.focus ,this.titlesearch }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var txtsearch = TextEditingController();
  var selectedcategory ;

  var  listfilter = [
    "Best Selling",
    "Popular",
    "Super Deal",
    "Name A-z",
    "Name z-A",
    "Price",
    "Filter",

  ];
  var  sortparam = [
    "best_selling",
    "popular",
    "discount",
    "desc",
    "asc",
    "price",
    "filter",

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      txtsearch.text = widget.titlesearch;


  }
  Widget build(BuildContext context) {
    // TODO: implement build
    // BlocProvider.of<ProductSearchBloc>(context,listen: false).add(QueryProduct(""));



    return Scaffold(
      appBar: AppBar(

        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: Container(
          alignment: Alignment.center,
          height: 40,
          width: double.maxFinite,

          child: TextField(
            autofocus: widget.focus,
            style: TextStyle(

                fontSize: 13
            ),
            controller: txtsearch,

            onSubmitted: (value) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  SearchScreen(
                  sortby: 6,
                  focus: false,
                  searchtitle: value,


                );
              },));


              print("Search event send");
              // BlocProvider.of<ProductSearchBloc>(context,listen: false).add(QueryProduct(txtsearch.text));

              print(txtsearch.text);
            },

            onTap: () {
              setState(() {

              });
            },
            decoration: InputDecoration(
                filled: false,

                // fillColor: Color(AppColorConfig.bgfill),
                hintText: 'Search by brand color, name ..etc',
                contentPadding: EdgeInsets.only(right: 24),

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



        ],

      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white
            ),

          ),
        ),
      ),
    );
  }
}
