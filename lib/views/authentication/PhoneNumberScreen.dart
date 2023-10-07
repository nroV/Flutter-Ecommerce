
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

import 'package:lottie/lottie.dart';

import 'CredentialScreen.dart';
class PhoneNumberScreen extends StatefulWidget {
  var username;
  var lastname;
  var isowner ;
  var firstname;
 PhoneNumberScreen({Key? key,
   this.isowner, this.username,
   this.lastname, this.firstname}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  var telephone = "+234";
  var txttelephone = TextEditingController();

  String? countries;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColorConfig.bgcolor).withOpacity(0.1),
        elevation: 0,
        actions: [
          TextButton(onPressed: () {
            print(widget.username);
            print(telephone);
            print( countries);
            print(   txttelephone.text );
            var userphone = "+" +telephone +  txttelephone.text;
            print(userphone);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CredentialScreen(

                    firstname: widget.firstname,
                    lastname: widget.lastname,
                    username: widget.username,
                    isowner: widget.isowner,
                    tele: userphone,

                  );
              },));
          }, child:Text("Next",style: TextStyle(
            fontSize: 12.8,
            color: Colors.black,
            fontWeight: FontWeight.w400

          ),))
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
              return SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO image phone here
                    Container(
                      height: constraints.maxHeight*0.45,
                      child: Column(
                        children: [
                          Center(
                            child: Lottie.asset("assets/lotties/phonenumber.json",
                                fit: BoxFit.cover,
                                height: 90,
                                width:constraints.maxWidth*0.75
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your Phone",style: Theme.of(context).textTheme.headlineLarge,),
                          SizedBox(height: 5,),
                          Text("Please comfirm your country phone number and choose from the box bellow",
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                          //TODO form here

                          Container(

                            margin: EdgeInsets.only(top: 25,bottom: 15),
                            child: TextField(
                              readOnly: true,

                              style: TextStyle(
                                  fontSize: 13
                              ),

                              onTap: ()=>    showCountryPicker(
                                context: context,
                                useSafeArea: true,

                                countryListTheme: CountryListThemeData(
                                    backgroundColor: Colors.white,
                                    bottomSheetHeight: constraints.maxWidth*0.9,
                                    searchTextStyle: TextStyle(
                                        fontSize: 12.8
                                    ),
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(bottom: 15),
                                    inputDecoration: InputDecoration(
                                      labelStyle: TextStyle(
                                          fontSize: 12.8
                                      ),


                                      label: Text("Search country"),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(7),
                                          borderSide: BorderSide.none
                                      ),
                                      floatingLabelStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.5)
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(7),
                                          borderSide: BorderSide(
                                              color: Colors.black
                                          )
                                      ),

                                      fillColor: Color(AppColorConfig.bgfill),



                                    )
                                ),
                                showPhoneCode: true, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  print('Select country: ${country.displayName}');
                                  setState(() {
                                    countries = country.name;
                                    telephone = country.phoneCode;

                                  });
                                },
                              ),
                              decoration: InputDecoration(
                                  hintText:  countries ?? 'Country',

                                  filled: true,

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
                          //TODO select country

                          Row(
                            children: [

                              Expanded(

                                child: Container(
                                  height: 50,

                                  width: double.maxFinite,
                                  child: TextField(
                                    style: TextStyle(
                                        fontSize: 13
                                    ),

                                    onTap: () {
                                      setState(() {

                                      });
                                    },
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText:'+' +telephone ?? '+000',

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
                              ),
                              SizedBox(width: 10,),

                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 50,

                                  width: double.maxFinite,
                                  child: TextField(

                                    style: TextStyle(
                                        fontSize: 13
                                    ),

                                    onTap: () {
                                      setState(() {

                                      });
                                    },
                                    controller: txttelephone,
                                    onSubmitted: (value) {
                                      setState(() {
                                        txttelephone.text = value;
                                      });
                                    },
                                    decoration: InputDecoration(

                                        filled: true,


                                        fillColor: Color(AppColorConfig.bgfill),
                                        label: Text("Telephone"),
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
                              ),
                            ],
                          ),

                        ],
                      ),
                    )




                    //TODO register Phone num here
                  ],
                ),
              );
          },

        )
      ),
    );
  }


}
