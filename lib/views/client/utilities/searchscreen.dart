import 'package:ecommerce/views/client/NavScreen.dart';
import 'package:ecommerce/views/client/utilities/SearchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../res/constant/appcolor.dart';
import '../../../viewmodel/category/category_bloc.dart';
import '../../../viewmodel/products/product_bloc.dart';
import '../../widget/Product/GridCardItem.dart';
import '../product/Product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ModelFilter.dart';

class SearchScreen extends StatefulWidget {
  var sortby;

  var focus;

  var searchtitle;

  SearchScreen({Key? key, this.sortby, this.focus, this.searchtitle})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var txtsearch = TextEditingController();
  var selectedcategory;

  var listfilter = [
    "Best Selling",
    "Popular",
    "Super Deal",
    "Name A-z",
    "Name z-A",
    "Price",
    "Filter",
  ];
  var sortparam = [
    "best_selling",
    "popular",
    "discount",
    "name",
    "-name",
    "price",
    "filter",
  ];

  var txtmax = TextEditingController();
  var txtmin = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtsearch.text = widget.searchtitle;

    selectedcategory = widget.sortby;
    print(widget.searchtitle);

    if (widget.sortby == 2) {
      print("In sort ");
      context.read<ProductBlocSorting>().add(DiscountProduct());
    } else {
      print("Seraching is real");
      print(widget.searchtitle);
      if (widget.searchtitle != null) {
        context.read<ProductBlocSorting>().add(SortProductSearch(
            sortname: "id", rank: "DESC", title: widget.searchtitle));
        return;
      }
      print("Sort by something");

      context.read<ProductBlocSorting>().add(SortProduct(
          sortname: sortparam[widget.sortby], rank: "DESC", title: null));
    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    // BlocProvider.of<ProductSearchBloc>(context,listen: false).add(QueryProduct(""));

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyNavScreen();
                  },
                ),
                (route) => false,
              );
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Container(
            alignment: Alignment.center,
            height: 40,
            width: double.maxFinite,
            child: TextField(
              autofocus: widget.focus,
              style: TextStyle(fontSize: 13),
              controller: txtsearch,
              onSubmitted: (value) {
                print("Search event send");
                // BlocProvider.of<ProductSearchBloc>(context,listen: false).add(QueryProduct(txtsearch.text));
              },
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      focus: true,
                      titlesearch: txtsearch.text,
                    );
                  },
                ));
              },
              decoration: InputDecoration(
                  filled: false,

                  // fillColor: Color(AppColorConfig.bgfill),
                  hintText: 'Search by brand color, name ..etc',
                  // prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  contentPadding: EdgeInsets.only(right: 24),
                  floatingLabelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          elevation: 0,
          titleSpacing: 0,
          backgroundColor: Colors.white.withOpacity(0.14),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () => showModalBottomSheet(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  isDismissible: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {

                            return ShowModelFilter(search: widget.searchtitle,);
                  },
                ),
                child: Image.asset(
                  'assets/logo/filter-32.png',
                  width: 10 + 14,
                  height: 10 + 14,
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  children: [
                    Container(
                        width: double.maxFinite,
                        height: 36,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listfilter.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (index == 2) {
                                  print("run");
                                  context
                                      .read<ProductBlocSorting>()
                                      .add(DiscountProduct());
                                } else {
                                  if (txtsearch.text == null) {
                                    context
                                        .read<ProductBlocSorting>()
                                        .add(SortProduct(
                                          title: null,
                                          sortname: sortparam[index],
                                          rank: "DESC",
                                        ));
                                  } else {
                                    print(widget.searchtitle);
                                    print("Search push on click here");
                                    context
                                        .read<ProductBlocSorting>()
                                        .add(SortProduct(
                                          title: widget.searchtitle,
                                          sortname: sortparam[index] == "-name"
                                              ? "name"
                                              : sortparam[index],
                                          rank: sortparam[index] == "name"
                                              ? "ASC"
                                              : "desc",
                                        ));
                                  }
                                  print("even sent here");
                                }

                                setState(() {
                                  selectedcategory = index;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 25,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: selectedcategory == index
                                        ? Color(AppColorConfig.success)
                                        : null,
                                    border: selectedcategory == index
                                        ? Border.all(color: Colors.white,style: BorderStyle.solid)
                                        : Border.all(color: Colors.grey.withOpacity(0.25)),
                                    borderRadius: BorderRadius.circular(8)),
                                margin: EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.filter_list,
                                      size: 12,
                                      color: selectedcategory == index
                                          ? Color(AppColorConfig.primarylight)
                                          : Color(AppColorConfig.success),
                                    ),
                                    Text(
                                      "${listfilter?[index]}",
                                      style: TextStyle(
                                          fontSize: 10.8,
                                          color: selectedcategory == index
                                              ? Color(
                                                  AppColorConfig.primarylight)
                                              : Color(AppColorConfig.success)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                    BlocConsumer<ProductBlocSorting, ProductState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is ProductSortError) {
                          return Center(
                            child: Text("No item found"),
                          );
                        }
                        if (state is ProductSortLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is ProductSortCompleted) {
                          var productlen = state.product!.results!.length;
                          print(productlen);

                          return productlen <= 0
                              ? Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Item found: 0",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color(AppColorConfig.success)),
                                      ),
                                      Text(
                                        "Try another search",
                                        style: TextStyle(
                                            fontSize: 12.8, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                )
                              : Expanded(
                                  child: GridView.builder(
                                    itemCount: productlen ?? 0,
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 5,
                                            mainAxisExtent: 280,
                                            childAspectRatio: 19 / 12,
                                            mainAxisSpacing: 5),
                                    itemBuilder: (context, index) {
                                      var product =
                                          state.product!.results![index];
                                      return Container(
                                        height: 430,
                                        child: Card(
                                          elevation: 0,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return ProductDetailScreen(
                                                    product: state.product
                                                        ?.results![index],
                                                    productv2: null,
                                                  );
                                                },
                                              ));
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Image.network(
                                                      '${product!.imgid![0].images} ',
                                                      fit: BoxFit.contain,
                                                      width: double.maxFinite,
                                                      height: 180,
                                                    ),
                                                    Positioned(
                                                      top: 5,
                                                      right: 0,
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              size: 20,
                                                              color: Colors
                                                                  .amberAccent,
                                                            ),
                                                            Text(
                                                              "${product.avgRating!.floorToDouble()}",
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    if (product.discount != 0)
                                                      Container(
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  AppColorConfig
                                                                      .negativelight),
                                                              border: Border.all(
                                                                  color: Color(
                                                                      AppColorConfig
                                                                          .negativecolor),
                                                                  width: 1)),
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          width: 70,
                                                          child: Text(
                                                            "${product.discount} % ",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    AppColorConfig
                                                                        .negativecolor),
                                                                fontSize: 12.8
                                                                // backgroundColor:    Color(AppColorConfig.negativelight)
                                                                ),
                                                          )),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Text(
                                                        "${product.sellRating} sold",
                                                        style: TextStyle(
                                                            fontSize: 12.8,
                                                            color: Color(
                                                                AppColorConfig
                                                                    .success)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, top: 9),
                                                  child: Text(
                                                    "${product.productname}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.maxFinite,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "\$ ${product.price}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Color(
                                                                  AppColorConfig
                                                                      .success),
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
                                );
                        } else {
                          return Center(
                            child: Text("No item found"),
                          );
                        }
                      },
                    ),
                  ],
                ))));
  }
}
