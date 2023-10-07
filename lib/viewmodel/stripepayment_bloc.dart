import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stripepayment_event.dart';
part 'stripepayment_state.dart';

class StripepaymentBloc extends Bloc<StripepaymentEvent, StripepaymentState> {
  StripepaymentBloc() : super(StripepaymentInitial()) {
    on<StripepaymentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
