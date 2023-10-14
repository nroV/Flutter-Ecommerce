import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/authlogin/login_bloc.dart';
import 'package:ecommerce/views/client/NavScreen.dart';
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
  void initState() {
    // TODO: implement initState
    getemailandpass();
    super.initState();
  }
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

              if(state is LoginLoading){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is LoginError){
                return Center(
                  child: Text("Error has been occur"),
                );
              }
              if(state is LoginCompleted){
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                  Verifycomplete(state.token?.access,state.token?.user?.id);
                });
                return MyNavScreen(uid: state.token?.user?.id,
                login: true,
                  token: state.token?.access,
                );
              }
              else{
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
                          print(email);
                          print(pass);
                          BlocProvider.of<LoginBloc>(context,listen: false).add(LoginUser(email, pass));
                          // Navigator.pushAndRemoveUntil(context,
                          //   MaterialPageRoute(builder: (context) {
                          //     return MyNavScreen();
                          //   },), (route) {
                          //     return false;
                          //   },);
                        },
                      ),

                    ],
                  ),
                );
              }


            }


        ),
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
