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
class LoginForm extends StatefulWidget {
  var error;
 LoginForm({
    super.key,
   this.error
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var istap = false;

  var txtemail = TextEditingController();
  var txtpassword = TextEditingController();
  AuthService auth = AuthService();
  LoginBloc login = LoginBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  Widget build(BuildContext context) {





          return Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text("Welcome back! Glad to see you again",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineLarge,),
                    ),
                    SizedBox(width: 50,)
                  ],
                ),
                SizedBox(height: 10,),
                if(widget.error !=null )
                Text(widget.error ,style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.8
                ),),

                Container(
                  height: 45,
                  margin: EdgeInsets.only(top: 25),
                  child: TextField(
                    style: TextStyle(

                        fontSize: 13
                    ),
                    controller: txtemail,
                    onSubmitted: (value) {
                      setState(() {
                        txtemail.text = value;
                      });
                    },

                    onTap: () {
                      setState(() {
                        istap = false;
                      });
                    },
                    decoration: InputDecoration(
                        filled: true,

                        fillColor: Color(AppColorConfig.bgfill),
                        label: Text("Email"),
                        floatingLabelStyle: TextStyle(
                            color: Colors.black
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),

                  ),
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(top: 25),
                  child: TextField(
                    style: TextStyle(
                        fontSize: 13
                    ),
                    controller: txtpassword,
                    onSubmitted: (value) {
                      setState(() {
                        txtpassword.text = value;
                      });
                    },
                    onTap: () {
                      setState(() {
                        istap = !istap;
                      });
                    },
                    decoration: InputDecoration(
                        filled: true,

                        suffixIcon:
                        istap == true ?
                        Icon(Icons.remove_red_eye, color: Colors.grey,) : null,
                        fillColor: Color(AppColorConfig.bgfill),
                        label: Text("Password"),
                        floatingLabelStyle: TextStyle(
                            color: Colors.black
                        ),

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),

                  ),
                ),
                //TODO forget password
                SizedBox(height: 15,),
                Text('forget password?', textAlign: TextAlign.right,),

                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  width: double.maxFinite,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      backgroundColor: Color(AppColorConfig.primarycolor),
                      padding: EdgeInsets.all(10),

                    ),
                    onPressed: () {
                      // login.add(LoginUser(txtemail.text, txtpassword.text));
                      BlocProvider.of<LoginBloc>(context).add(LoginUser(txtemail.text, txtpassword.text));


                    }, child: Text("Login",
                    textAlign: TextAlign.center,
                    style:
                    Theme
                        .of(context)
                        .textTheme
                        .displaySmall,),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 1,

                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Continue with", style: TextStyle(
                        fontSize: 12.8,
                        color: Colors.grey
                    ),),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 1,

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),

                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 1,
                  margin: EdgeInsets.only(bottom: 20),


                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            auth.signInWithGoogle();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            backgroundColor: Color(AppColorConfig.bgcolor)
                                .withOpacity(0.85),
                            padding: EdgeInsets.all(10),

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/logo/Google.png'),
                              SizedBox(width: 10,),
                              Text("Google", style: TextStyle(
                                  fontSize: 12.7,
                                  color: Colors.grey
                              ),)
                            ],),


                        ),
                      ),
                      SizedBox(width: 10,),


                      Expanded(
                        child: ElevatedButton.icon(


                          label: Text(" Continue as guest",

                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 10.8
                            ),
                          ),
                          icon:Icon(Icons.person) ,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.all(10),

                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                                return MyHomeScreen();
                              },), (route) {
                                return false;
                              },);
                          },
                        ),
                      ),


                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                        return RegisterScreen();
                      },), (route) {
                        return false;
                      },);
                  },
                  child: Container(

                    alignment: Alignment.center,
                    child: Text('New member here? Sign Up Now',
                      style: TextStyle(
                          fontSize: 12.8,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),

                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              ],
            ),
          );





  }

  void setLoginTrue() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs.setBool("islogin",true);
    print(prefs.getBool("islogin"));
  }
}