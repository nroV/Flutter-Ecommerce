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
  List<Object?> get props => throw UnimplementedError();

}
class RegisterCompleted extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class RegisterError extends RegisterState {

  var message;

  RegisterError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


