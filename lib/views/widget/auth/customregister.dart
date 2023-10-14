

import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/res/constant/stripesecretkey.dart';
import 'package:ecommerce/views/authentication/PhoneNumberScreen.dart';
import 'package:ecommerce/views/client/NavScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../model/Ulti/Genders.dart';
import '../../authentication/AccountRoleScreen.dart';
import '../../authentication/LoginScreen.dart';
import '../../client/Home.dart';
class RegisterForm extends StatefulWidget {
 RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var istap = false;
  Map<String, dynamic >? paymentintent;

  var fname = TextEditingController();
  var lname = TextEditingController();
  var username = TextEditingController();
  var genderlist = [Genders.Male.name,Genders.Female.name,Genders.Other.name];
  var gender =Genders.Male.name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  Widget build(BuildContext context) {
    return SingleChildScrollView(


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              SizedBox(height: 20,),
          //TODO login gmail or facebook here
          Container(
            width: MediaQuery.of(context).size.width*1,
            margin: EdgeInsets.only(bottom: 20),


            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,

              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {



                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      backgroundColor: Color(AppColorConfig.bgcolor).withOpacity(0.85),
                      padding: EdgeInsets.all(10),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo/Google.png'),
                        SizedBox(width: 10,),
                        Text("Google",style: TextStyle(
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
                          return MyNavScreen();
                        },), (route) {
                          return false;
                        },);
                    },
                  ),
                ),




              ],
            ),

          ),
          //TODO Bar

          Container(
            width: MediaQuery.of(context).size.width*1,
            margin: EdgeInsets.only(bottom: 20),


            child:     Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    height: 1,

                  ),
                ),
                SizedBox(width: 10,),
                Text("Or",style: TextStyle(
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
          ),

          Container(
            height: 45,
            margin: EdgeInsets.only(top: 25),
            child: TextField(
              style: TextStyle(
                  fontSize: 13
              ),cursorColor: Colors.grey,
              controller: fname,
              onSubmitted: (value) {
                setState(() {
                  fname.text = value;
                });
              },

              onTap: () {
                setState(() {
                  istap =false;
                });
              },
              decoration: InputDecoration(
                  filled: true,

                  fillColor: Color(AppColorConfig.bgfill),
                  label: Text("Firstname"),
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
            //TODO form here
          Container(
            height: 45,
            margin: EdgeInsets.only(top: 25),
            child: TextField(
              cursorColor: Colors.grey,
              style: TextStyle(
                  fontSize: 13
              ),

              onTap: () {
                setState(() {
                  istap =false;
                });
              },
              controller: lname,
              onSubmitted: (value) {
                setState(() {
                  lname.text = value;
                });
              },
              decoration: InputDecoration(
                  filled: true,

                  fillColor: Color(AppColorConfig.bgfill),
                  label: Text("lastname"),
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
              cursorColor: Colors.grey,
              style: TextStyle(
                  fontSize: 13
              ),

              onTap: () {

              },
              controller: username,
              onSubmitted: (value) {
                setState(() {
                  username.text = value;
                });
              },
              decoration: InputDecoration(
                  filled: true,





                  label: Text("username"),
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
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xffF1F1F1),
              borderRadius: BorderRadius.circular(6),

            ),
            child: DropdownButton(
              elevation: 0,
              padding: EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 0),
              underline: SizedBox(),


              // Initial Value
              value:gender  ,


              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              alignment: Alignment.center,
              isExpanded: true,
              style: TextStyle(
                  fontSize: 12.8,color: Colors.black,
                  fontWeight: FontWeight.w400

              ),

              // Array list of items
              items: genderlist.map((items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items.toString()),
                );
              }).toList(),
              onChanged: (dynamic value) {
                setState(() {
                  gender   = value!;

                });
              },
              // After selecting the desired option,it will
              // change button value to selected value


            ),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Remember me',textAlign: TextAlign.right,style: TextStyle(
                color: Colors.grey,
                fontSize: 12.8
              ),),
              Text('forget password?',textAlign: TextAlign.right,style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.8
              ),),
            ],
          ),
          SizedBox(height: 5,),

          Container(
            margin: EdgeInsets.only(top: 15,bottom: 15),
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
                //TODO login Register here
                print(username.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return  PhoneNumberScreen(
                        firstname: fname.text,
                        lastname: lname.text,
                        username: username.text,
                        isowner: false,
                        gender: gender,
                        );
                },));

              }, child:Text("Register",
              textAlign: TextAlign.center,
              style:
              Theme.of(context).textTheme.displaySmall,),
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return  loginScreen(


                  );
                },), (route) {
                  return false;
                },);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text('Already have an account? Login Now',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.8
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 7,),
        ],
      ),
    );
  }


}



