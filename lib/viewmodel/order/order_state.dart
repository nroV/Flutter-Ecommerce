part of 'order_bloc.dart';


abstract class OrderState {}

class OrderInitial extends OrderState {

}
class OrderLoading extends OrderState {

}

class OrderSuccessError extends OrderState {

}

class OrderSuccessCompleted extends OrderState {
  OrderReponse? orderReponse;
  var orderid;


  OrderSuccessCompleted({this.orderReponse}){
    print(this.orderReponse);
  }
}
class OrderError extends OrderState {

}

class OrderSuccess extends OrderState {
  OrderReponse? orderReponse;

  OrderSuccess(this.orderReponse);
}
class OrderDetailLoading extends OrderState{

}
class OrderDetailError extends OrderState{

}
class OrderDetailSuccess extends OrderState{
OrderDetail? orderDetail;

OrderDetailSuccess(this.orderDetail);
}
