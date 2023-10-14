
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/authlogin/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'CredentialScreen.dart';
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'VerifyScreen.dart';


class CredentialScreen extends StatefulWidget {
   var isowner ;
   var username;
   var lastname;
   var firstname;
   var tele;
   var gender;
   CredentialScreen ({Key? key,this.isowner,this.username,this.lastname,this.firstname,this.tele,this.gender}) : super(key: key);

  @override
  State<CredentialScreen> createState() => _CredentialScreenState();
}

class _CredentialScreenState extends State<CredentialScreen> {
  var txtemail = TextEditingController();
  var txtpassword = TextEditingController();
  var istap = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.isowner);
    print(widget.firstname);
    print(widget.lastname);
    print(widget.username);
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return BlocConsumer<RegisterBloc,RegisterState>(
  listener: (context, state) {
    // TODO: implement listener
    print(state);
  },
  builder: (context, state) {

    if(state is Registerloading) {
        return Center(
          child: CircularProgressIndicator(),
        );
    }
    if(state is RegisterCompleted) {
      storeemailandpass(txtemail.text,txtpassword.text);

      return VerifyScreen();

    }
    if(state is RegisterError) {
      return Center(
        child: Text("Email is already existed"),
      );
    }
    else{
      return SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO image phone here
            Center(
              child: Lottie.asset("assets/lotties/lock.json",
                  fit: BoxFit.cover,

                  width:double.maxFinite
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your Credential",style: Theme.of(context).textTheme.headlineLarge,),
                  SizedBox(height: 10,),
                  Text("Please enter your credential email and password for login to our application",
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                  //TODO form here

                  //TODO select country
                  SizedBox(height: 25,),
                  Container(
                    height: 50,

                    width: double.maxFinite,
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextField(
                      style: TextStyle(
                          fontSize: 13
                      ),

                      onTap: () {
                        setState(() {

                        });
                      },
                      controller: txtemail,
                      cursorColor: Colors.grey,
                      onSubmitted: (value) {
                        setState(() {
                          txtemail.text = value;
                        });
                      },

                      decoration: InputDecoration(
                          filled: true,
                          hintText:'',
                          label: Text("Email"),

                          fillColor: Color(AppColorConfig.bgfill),

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
                    margin: EdgeInsets.only(top: 5),
                    child: TextField(
                      style: TextStyle(
                          fontSize: 13
                      ),
                      cursorColor: Colors.grey,
                      controller: txtpassword,
                      obscureText:
                      istap == true ? istap :

                      false,
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
                          Icon(Icons.remove_red_eye, color: Colors.grey,) :
                          Icon(Icons.remove_red_eye_outlined, color: Colors.grey,),

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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 1,bottom: 15,left: 15,right: 15),
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
                  print("HEllo world");
                  BlocProvider.of<RegisterBloc>(context,listen: false).add(OnRegister(
                      widget.firstname, widget.lastname,
                      txtemail.text, txtpassword.text, widget.tele, widget.username,widget.gender));

                  // Navigator.pushAndRemoveUntil(context,
                  //   MaterialPageRoute(builder: (context) {
                  //     return VerifyScreen();
                  //   },), (route) {
                  //   return false;
                  // },);


                }, child:Text("Sign In",
                textAlign: TextAlign.center,
                style:
                Theme.of(context).textTheme.displaySmall,),
              ),
            ),





            //TODO register Phone num here
          ],
        ),
      );
    }

  },
);
            },

          )
      ),
    );
  }

  void storeemailandpass(email,pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email",email);
    prefs.setString("pass", pass);
  }
}
