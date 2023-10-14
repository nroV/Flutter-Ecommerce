part of 'address_bloc.dart';


abstract class AddressState {}

class AddressInitial extends AddressState {


}


class AddressLoading extends AddressState {


}


class AddressError extends AddressState {


}




class AddressRequestLoading extends AddressState {


}


class AddressRequestError extends AddressState {


}
class AddressRequestDone extends AddressState {

  AddressModelResponse? add;

  AddressRequestDone({this.add});
}
class AddressDone extends AddressState {

  AddressModel? add;

  AddressDone({this.add});
}
