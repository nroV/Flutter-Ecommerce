part of 'address_bloc.dart';


abstract class AddressEvent {


}
class FetchAddress extends AddressEvent {
  var userid;

  FetchAddress({this.userid});
}
class PostAddress extends AddressEvent {
  AddressBody? add;
  var userid;

PostAddress({this.add,this.userid});
}

