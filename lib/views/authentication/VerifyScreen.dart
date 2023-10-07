import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/authlogin/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../client/Home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyScreen extends StatefulWidget {
  VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  var pass;
  var email;

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
            switch(state) {
              case LoginLoading :
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case LoginError :
                return Center(
                  child: Text("Error has been occur"),
                );
                break;
              case LoginCompleted :
                return MyHomeScreen();
                break;
              default:
               return Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Verify Your Account", style: Theme
                          .of(context)
                          .textTheme
                          .headlineLarge,),
                      SizedBox(height: 10,),
                      Text(
                        "An email related to your account registered has been sent , please check email to verify before you can continue",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.8
                        ),
                      ),
                      Lottie.asset('assets/lotties/mail.json'),
                      ElevatedButton.icon(
                        onLongPress: () {
                          Verifycomplete();
                        },

                        label: Text("Continue",

                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.8
                          ),
                        ),
                        icon: Icon(Icons.lock),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: Color(AppColorConfig.primarycolor),
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

                    ],
                  ),
                );
                break;
            }

          },
        ),
      ),
    );
  }

  void Verifycomplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    email = prefs.getString("email");
    pass = prefs.getString("pass");
  }
}
