import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/repository/Product/ProductRepository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../model/Product/ProductModel.dart';
part 'product_event.dart';

part 'product_state.dart';
ProductRepository productRepository = ProductRepository();
class ProductBloc extends Bloc<ProductEvent, ProductState> {

  ProductBloc() : super(ProductInitial()) {
    on<FetchProduct>((event, emit) => FetchingProduct(event,emit) ,);
    on<SortProduct>((event, emit) => SortingProduct(event,emit) ,);


  }



  FetchingProduct(FetchProduct event, Emitter<ProductState> emit) async {


      // TODO: implement event handler
      emit(ProductLoading());

      try{
        var response = await productRepository.FetchProduct();
        print("Product bloc here");
        print(response);


        emit(ProductCompleted(product:response));

      }catch(error) {
        print(error.toString());
        emit(ProductError());
      }



  }

  SortingProduct(SortProduct event, Emitter<ProductState> emit) async {

    emit(ProductLoading());
    try{
      var response = await productRepository.FetchProduct();
      print("Product sort bloc here");
      print(response);


      emit(ProductCompleted(product:response));

    }catch(error) {
      print(error.toString());
      emit(ProductSearchError());
    }


  }

  QueryProductSearch(QueryProduct event, Emitter<ProductState> emit) async {
    emit(ProductSearchLoading());
    try{
      var response = await productRepository.QueryProduct(event.search);
      print("Product query event send");
      print(response);


      emit(ProductSerachCompleted(product:response));

    }catch(error) {
      print(error.toString());
      emit(ProductSearchError());
    }
  }


}


class ProductSearchBloc extends Bloc<ProductEvent, ProductState> {

  ProductSearchBloc() : super(ProductInitialSearch()) {

    on<QueryProduct>((event, emit) => QueryProductSearch(event,emit) ,);

  }

  FetchingProduct(FetchProduct event, Emitter<ProductState> emit) async {


    // TODO: implement event handler
    emit(ProductLoading());

    try{
      var response = await productRepository.FetchProduct();
      print("Product bloc here");
      // print(response);


      emit(ProductCompleted(product:response));

    }catch(error) {
      print(error.toString());
      emit(ProductError());
    }



  }

  SortingProduct(SortProduct event, Emitter<ProductState> emit) async {

    emit(ProductLoading());
    try{
      var response = await productRepository.FetchProduct();
      print("Product sort bloc here");
      // print(response);


      emit(ProductCompleted(product:response));

    }catch(error) {
      print(error.toString());
      emit(ProductSearchError());
    }


  }

  QueryProductSearch(QueryProduct event, Emitter<ProductState> emit) async {

    emit(ProductSearchLoading());
    try{
      var response = await productRepository.QueryProduct(event.search);
      print("Product query event send");
      // print(response);


      emit(ProductSerachCompleted(product:response));

    }catch(error) {
      print(error.toString());
      emit(ProductSearchError());
    }
  }


}

class ProductDiscountBloc extends Bloc<ProductEvent, ProductState> {
  ProductDiscountBloc() : super(ProductInitial()) {

    on<DiscountProduct>((event, emit) =>Discount(event,emit) ,);
  }
  Discount(DiscountProduct event, Emitter<ProductState> emit) async {

    emit(ProductLoadingDiscount());
    try{
      var response = await productRepository.FetchProductDiscount( );
      print("Discount event sent");
      print(response);


      emit( ProductDiscountCompleted(product:response));

    }catch(error) {
      print(error.toString());
      emit(ProductErrorDiscount());
    }

  }
}