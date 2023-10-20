
import 'package:ecommerce/viewmodel/Review/review_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/User/user_bloc.dart';
import '../viewmodel/authlogin/login_bloc.dart';
import '../viewmodel/authlogin/register_bloc.dart';
import '../viewmodel/cart/cart_bloc.dart';
import '../viewmodel/category/category_bloc.dart';
import '../viewmodel/image_bloc.dart';
import '../viewmodel/order/order_bloc.dart';
import '../viewmodel/products/address_bloc.dart';
import '../viewmodel/products/product_bloc.dart';
class AppProvider {
  static get allblocprovider =>[
    BlocProvider<ImageBloc>(
      create: (BuildContext context) => ImageBloc(),
    ),
    BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(),
    ),
    BlocProvider<CategoryBlocProduct>(
      create: (BuildContext context) => CategoryBlocProduct(),
    ),
    BlocProvider<RegisterBloc>(
      create: (BuildContext context) => RegisterBloc(),
    ),
    BlocProvider<ProductBlocBestRating>(
      create: (BuildContext context) => ProductBlocBestRating(),
    ),
    BlocProvider<ProductBloc>(
      create: (BuildContext context) => ProductBloc(),
    ),
    BlocProvider<ProductBlocBestPrice>(
      create: (BuildContext context) => ProductBlocBestPrice(),
    ),
    BlocProvider<ProductBlocBestSell>(
      create: (BuildContext context) => ProductBlocBestSell(),
    ),
    BlocProvider<ProductBlocSorting>(
      create: (BuildContext context) => ProductBlocSorting(),
    ),
    BlocProvider<ProductDiscountBloc>(
      create: (BuildContext context) => ProductDiscountBloc(),
    ),
    BlocProvider<CategoryBlocProduct>(
      create: (BuildContext context) => CategoryBlocProduct(),
    ),
    BlocProvider<CategoryBlocProduct>(
      create: (BuildContext context) => CategoryBlocProduct(),
    ),

    BlocProvider<CategoryBloc>(
      create: (BuildContext context) => CategoryBloc(),
    ),
    BlocProvider<AddressBlocV2>(
      create: (BuildContext context) => AddressBlocV2(),
    ),
    BlocProvider<ProductDiscountBloc>(
      create: (BuildContext context) => ProductDiscountBloc(),
    ),
    BlocProvider<ProductSearchBloc>(
      create: (BuildContext context) => ProductSearchBloc(),
    ),
    BlocProvider<CartBloc>(
      create: (BuildContext context) => CartBloc(),
    ),
    BlocProvider<AddressBloc>(
      create: (BuildContext context) => AddressBloc(),
    ),
    BlocProvider<OrderBloc>(
      create: (BuildContext context) => OrderBloc(),
    ),
    BlocProvider<OrderBlocUser>(
      create: (BuildContext context) => OrderBlocUser(),
    ),
    BlocProvider<UserBloc>(
      create: (BuildContext context) => UserBloc(),
    ),
    BlocProvider<ReviewBloc>(
      create: (BuildContext context) => ReviewBloc(),
    ),

  ];
}