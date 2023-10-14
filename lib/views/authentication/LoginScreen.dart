import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/authlogin/login_bloc.dart';
import 'package:ecommerce/views/authentication/LoginUI.dart';
import 'package:flutter/material.dart';

import '../client/Home.dart';
import '../client/NavScreen.dart';
import '../widget/auth/customlogin.dart';
import 'dart:math';

import 'package:ecommerce/viewmodel/authlogin/login_bloc.dart';
import 'package:ecommerce/views/authentication/Register.dart';
import 'package:ecommerce/views/client/Home.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {

            if(state is LoginLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if(state is LoginError) {



              return Center(child:
                Text("Error has occur")
                ,);
            }

            if  (state is LoginCompleted) {

              // Navigator.pop(context);
              print(state.token?.access);
              setLoginTrue(state.token!.user!.id ?? 0,state.token?.access);

              // return Text("${state.token?.refresh}");
              // throw "done";
              return MyNavScreen();
            }
            if(state is LoginError) {



              return Text("Error has occur");
            }
            if(state is LoginUnAuthorize) {




              return LoginUI(errormessage: "there is no user associated with please consider register a new account",);
            }
            else {

              return LoginUI();
            }

          },
        ),
      ),
    );
  }
  void showAlertLoginWrong(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Unauthorize"),
      );
    },);
  }
  void setLoginTrue(int userid,String? tok) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs.setBool("islogin",true);
    print(userid);
    prefs.setInt("userid",userid);
    prefs.setString("token", tok!);
    print(prefs.getBool("islogin"));
  }
}


