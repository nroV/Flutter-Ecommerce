import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce/repository/User/UserRepository.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository user = UserRepository();
  RegisterBloc() : super(RegisterInitial()) {
    on<OnRegister>((event, emit) async {
      print("Event on register send");
      emit(Registerloading());
      try{
        print(event.username);
        // fname,lname,String? email,String? password,telephone,username
        var responsebody = await user.AuthUserSignUp(
            event.fname, event.lname, event.email, event.pass,event.tele,
            event.username,event.gender);
        print(responsebody);
        emit(RegisterCompleted());
      }catch(error) {
        print(error.toString());
        emit(RegisterError(error.toString()));
      }
      // TODO: implement event handler
    });
    // on<OnVerify>((event, emit) async {
    //   print("Event on register send");
    //   emit(Registerloading());
    //   try{
    //     print(event.email);
    //     print(event.password);
    //     // fname,lname,String? email,String? password,telephone,username
    //     var responsebody = await user.AuthUserSignUp(
    //         event.fname, event.lname, event.email, event.pass,event.tele,
    //         event.username);
    //     print(responsebody);
    //     emit(RegisterCompleted());
    //   }catch(error) {
    //     print(error.toString());
    //     emit(RegisterError(error.toString()));
    //   }
    //   // TODO: implement event handler
    // });
  }
}
