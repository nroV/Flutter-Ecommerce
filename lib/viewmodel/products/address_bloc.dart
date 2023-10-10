import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/model/Address/AddressRes.dart';
import 'package:ecommerce/repository/Product/AddressRepository.dart';
import 'package:meta/meta.dart';

import '../../model/Address.dart';
import '../../model/Address/AddressModel.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressRepository addressRepository = AddressRepository();
  AddressBloc() : super(AddressInitial()) {
    on<PostAddress>((event, emit) async {
      emit(AddressLoading());
      // TODO: implement event handler
      try{
        print("Send post event");
        var response = await addressRepository.PostAddress(event.add, event.userid);
        // print(response);



      }catch(error) {
        print(error.toString());
        emit(AddressError());
      }

    });


    on<FetchAddress>((event, emit) async {
      emit(AddressLoading());
      // TODO: implement event handler
      try{
        print("Send post event");
        var response = await addressRepository.FetchAddress(event.userid);
        print(response);
        emit(AddressDone(add:response ));


      }catch(error) {
        print(error.toString());
        emit(AddressError());
      }

    });
  }
}
