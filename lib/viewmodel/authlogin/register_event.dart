part of 'register_bloc.dart';


abstract class RegisterEvent {}

class OnVerify extends RegisterEvent {
  var email;
  var password;

  OnVerify(this.email, this.password);
}
class OnRegister extends RegisterEvent{
var fname;
var lname;
var email;
var pass;
var tele;
var username;

OnRegister(
      this.fname, this.lname, this.email, this.pass, this.tele, this.username);
}

