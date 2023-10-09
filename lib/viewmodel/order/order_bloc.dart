import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/model/Order/OrderRequest.dart';
import 'package:ecommerce/model/Order/OrderResponse.dart';
import 'package:meta/meta.dart';

import '../../model/Order/OrderDetail.dart';
import '../../model/Order/OrderReq.dart';
import 'package:equatable/equatable.dart';

import '../../repository/Order/OrderRepository.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepository orderRepository = OrderRepository();
  OrderBloc() : super(OrderInitial()) {
    on<PostOrderEvent>((event, emit) async {
      // TODO: implement event handler

      emit(OrderLoading());

      try{
        print("Event Order Send");
        print(event.addressid);
            var res = await orderRepository.PostOrderUser(event.addressid,event.orderRequestV2);
            // print(res.toString());
            print(res);
            emit(OrderSuccessCompleted(orderReponse: res));
            print("state change");
            // emit(OrderSuccess(res));

      }catch(error) {
        print(error);
        emit(OrderError());
      }
    });
    on<GetOrderDetail>((event, emit) async {
      // TODO: implement event handler

      emit(OrderDetailLoading());

      try{
        print("Event Order Detail Summar");
        var res = await orderRepository.GetOrderSummary(event.orderid);
        emit(OrderDetailSuccess(res));
      }catch(error) {
        emit(OrderDetailError());
      }
    });
  }
}
