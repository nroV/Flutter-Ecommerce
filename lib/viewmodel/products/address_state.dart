part of 'address_bloc.dart';


abstract class AddressState {}

class AddressInitial extends AddressState {


}


class AddressLoading extends AddressState {


}


class AddressError extends AddressState {


}


class AddressDone extends AddressState {

  AddressModel? add;

  AddressDone({this.add});
}
