part of 'register_bloc.dart';



abstract class RegisterState extends Equatable{}

class RegisterInitial extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}

class Registerloading extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props =>[ ];

}
class RegisterCompleted extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class RegisterError extends RegisterState {

  var message;

  RegisterError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props =>[message];

}
class RegisterAuthLoading extends RegisterState {


  RegisterAuthLoading();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class RegisterAuthComplete extends RegisterState {

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();



}

class RegisterAuthError extends RegisterState {
  var message;

  RegisterAuthError(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}


