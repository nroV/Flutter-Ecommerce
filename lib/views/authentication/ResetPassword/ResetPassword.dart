import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/authlogin/login_bloc.dart';
import 'package:ecommerce/views/client/NavScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../client/Home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'VerifyCompleted.dart';
import 'VerifyPassword.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var pass;
  var email;
  var txtfirst;
  var txtsec;
  var txtthird;
  var txtfourth;
  var alwaysfocus = FocusNode();
  var fifth;
  var fnodeone = FocusNode();
  var fnodetwo = FocusNode();
  var fnodethr = FocusNode();
  var fnodefou = FocusNode();
  var fnodefif = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    getemailandpass();
    alwaysfocus.requestFocus();
    super.initState();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: null,
      body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.email,size: 60,color: Color(AppColorConfig.success),),
          SizedBox(height: 16,),

          Text("Verification Code?", style: Theme
              .of(context)
              .textTheme
              .headlineLarge,),

          SizedBox(height: 10,),
          // Container(
          //
          //
          //   child: TextFormField(
          //     onSaved: (newValue) {
          //
          //     },
          //     keyboardType: TextInputType.number,
          //     maxLines: 1,
          //     maxLength: 1,
          //     focusNode: alwaysfocus,
          //
          //
          //     cursorColor: Colors.green,
          //     onChanged: (value) {
          //
          //
          //
          //
          //     },
          //     textInputAction: TextInputAction.next,
          //     decoration: InputDecoration(
          //       counterStyle: TextStyle(height: double.minPositive,),
          //       counterText: "",
          //       enabledBorder: UnderlineInputBorder(
          //           borderSide: BorderSide(
          //             color: Colors.grey,
          //           )
          //       ),
          //       focusedBorder:  UnderlineInputBorder(
          //           borderSide: BorderSide(
          //             color: Colors.green,
          //           )
          //       ),
          //     ),
          //
          //     style: TextStyle(
          //         fontSize: 27
          //     ),
          //     controller: txtfirst,
          //     textAlign: TextAlign.center,
          //   ),
          //
          //   height: 60,
          //   width: 60,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(


                child: TextFormField(
                  onSaved: (newValue) {

                  },
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  autofocus: true,
                  maxLength: 1,
                  focusNode: fnodeone,


                  cursorColor: Colors.green,
                  onChanged: (value) {
                    fnodeone.unfocus();
                    fnodetwo.requestFocus();



                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(height: double.minPositive,),
                    counterText: "",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )
                    ),
                    focusedBorder:  UnderlineInputBorder(
                  borderSide: BorderSide(
                  color: Colors.green,
                  )
    ),
                  ),

                  style: TextStyle(
                    fontSize: 27
                  ),
                  controller: txtfirst,
                  textAlign: TextAlign.center,
                ),

                height: 60,
                width: 60,
              ),
              Container(


                child: TextFormField(
                  onSaved: (newValue) {

                  },
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  maxLength: 1,
                  focusNode: fnodetwo,
                  onChanged: (value) {
                    fnodetwo.unfocus();
                    fnodethr.requestFocus();
                  },


                  cursorColor: Colors.green,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(height: double.minPositive,),

                    counterText: "",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    ),
                    focusedBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        )
                    ),
                  ),

                  style: TextStyle(
                      fontSize: 27
                  ),
                  controller: txtfirst,
                  textAlign: TextAlign.center,
                ),

                height: 60,
                width: 60,
              ),
              Container(


                child: TextFormField(
                  onSaved: (newValue) {

                  },
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  maxLength: 1,
                  focusNode: fnodethr,
                  onChanged: (value) {
                    fnodethr.unfocus();
                    fnodefou.requestFocus();
                  },


                  cursorColor: Colors.green,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(height: double.minPositive,),
                    counterText: "",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    ),
                    focusedBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        )
                    ),
                  ),

                  style: TextStyle(
                      fontSize: 27
                  ),
                  controller: txtfirst,
                  textAlign: TextAlign.center,
                ),

                height: 60,
                width: 60,
              ),
              Container(


                child: TextFormField(
                  onSaved: (newValue) {

                  },
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  maxLength: 1,
                  focusNode: fnodefou,
                  onChanged: (value) {
                    fnodefou.unfocus();
                    fnodefif.requestFocus();
                  },


                  cursorColor: Colors.green,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(height: double.minPositive,),
                    counterText: "",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    ),
                    focusedBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        )
                    ),
                  ),

                  style: TextStyle(
                      fontSize: 27
                  ),
                  controller: txtfirst,
                  textAlign: TextAlign.center,
                ),

                height: 60,
                width: 60,
              ),
              Container(


                child: TextFormField(
                  onSaved: (newValue) {

                  },
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  maxLength: 1,
                  focusNode: fnodefif,


                  cursorColor: Colors.green,
                  onChanged: (value) {
                    print("Last value ");
                    // fnodefif.unfocus();


                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(height: double.minPositive,),
                    counterText: "",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    ),
                    focusedBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        )
                    ),
                  ),

                  style: TextStyle(
                      fontSize: 27
                  ),
                  controller: txtfirst,
                  textAlign: TextAlign.center,
                ),

                height: 60,
                width: 60,
              ),

            ],
          ),
          SizedBox(height: 40,),

          Text(
            "An verfication code has sent to your email related to your account ",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12.8,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 16,),

          Row(
            
            children: [
              Expanded(

                child:
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                        padding: EdgeInsets.all(12),
              backgroundColor: Color(AppColorConfig.success)
          ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                        return VerifyPassword();
                      },), (route) => false);

                }, child: Text("Done")),
              ),
            ],
          ),
          SizedBox(height: 16,),
          Text(
            "Resend Code ",
            style: TextStyle(
              color: Colors.green,
              fontSize: 12.8,
            ),
            textAlign: TextAlign.center,
          ),

        ],
      ),
    )
      ),
    );
  }

  void getemailandpass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email");
    pass = prefs.getString("pass");
  }
  void Verifycomplete(token,userid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setInt('userid', userid);
    print(prefs.getString('token'));
    email = prefs.getString("email");
    pass = prefs.getString("pass");

  }
}
