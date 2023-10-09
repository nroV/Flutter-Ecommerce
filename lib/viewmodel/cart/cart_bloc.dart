import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../model/Product/CartModel.dart';
import '../../model/Product/ProductModel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, AllCart> {
  CartBloc() : super(InitState()) {
    on<CartToAdd>((event, emit) {
      // TODO: implement event handler

      List<CartItem>? curr = state.itemcart;
      var isupdate = false;
      int index = -1;
      state.itemcart!.forEach((element) {
            if(element.productid == event.cartitem!.productid) {

                isupdate = true;
                print(element.qty);
                index =state.itemcart!.indexOf(element);

            }

      });

      print(index);
      print(isupdate);
      if(isupdate == true) {
        print("Already existed");
        CartItem cartitem = state.itemcart![index];
        cartitem!.qty =    cartitem!.qty!  + 1;
        curr!.removeAt(index);



        curr!.insert(index, cartitem);
      }
      else {
        print("Does not exist");
        curr!.add(event!.cartitem!);
        // }
      }



      emit(AllCart(itemcart: curr));



      // emit(CartToAdd());

      //TODO getthe even add
    });
    on<CartToRemove>((event, emit) {
      // TODO: implement event handler
      print("Event Cart to Remove Send to bloc");

      List<CartItem>? curr = state.itemcart;

      CartItem? item =curr?.firstWhere((element) => element.productid == event.cartitem!.productid);
      int index = curr!.indexOf(item!);
      if(     item!.qty! > 0){
        item!.qty =   item!.qty! - 1;

        print(index);
        curr.removeAt(index);
        curr.insert(index, item);
      }
     if(item!.qty! == 0){
        item!.qty = 0;

        curr!.removeAt(index);


      }
      emit(AllCart(itemcart: curr));


      // emit(CartToAdd());

      //TODO getthe even add
    });
    on<CartRemoveAll>((event, emit) {
      // TODO: implement event handler
      print("Event Cart to Remove Send to bloc");

      List<CartItem>? curr = state.itemcart;

      CartItem? item =curr?.firstWhere((element) => element.productid == event.cartitem!.productid);
      int index = curr!.indexOf(item!);



      curr!.removeAt(index);


      emit(AllCart(itemcart: curr));


      // emit(CartToAdd());

      //TODO getthe even add
    });
    on<CartClear>((event, emit) {
      // TODO: implement event handler
      print("Event Cart to Clear Send to bloc");

      List<CartItem>? curr = state.itemcart;
      curr!.clear();


      emit(AllCart(itemcart: curr));


      // emit(CartToAdd());

      //TODO getthe even add
    });
  }
}
