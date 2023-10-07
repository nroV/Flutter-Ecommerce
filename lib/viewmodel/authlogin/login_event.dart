part of 'login_bloc.dart';


abstract class LoginEvent {

}


class LoginUser extends LoginEvent {
  var email;
  var password;

  LoginUser(this.email, this.password);
}
