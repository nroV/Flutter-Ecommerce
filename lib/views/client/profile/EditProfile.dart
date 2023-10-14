import 'package:ecommerce/res/appurl/appurl.dart';
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/User/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/Ulti/Genders.dart';
import '../../../model/Users/UserModel.dart';

class EditingProfile extends StatefulWidget {

  UserModel? user;

  EditingProfile({Key? key, this.user}) : super(key: key);

  @override
  State<EditingProfile> createState() => _EditingProfileState();
}

class _EditingProfileState extends State<EditingProfile> {
  var txtemail = TextEditingController();
  var txtfirstname = TextEditingController();
  var telephone = "234";
  var txttelephone = TextEditingController();
  var txtusername = TextEditingController();


  String? countries;
  bool istap = false;


  var genderlist = [Genders.Male.name, Genders.Female.name, Genders.Other.name];
  var gender = Genders.Male.name;
  var txtlname = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    setUserBinding(widget.user!);
    super.initState();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

          title: Text("Edit Profile", style: TextStyle(
              color: Colors.black
          ),),
          backgroundColor: Colors.white.withOpacity(0.24),
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    print("Event Edit");
                    print(txtfirstname.text);
                    print(widget?.user?.id.toString());

                    BlocProvider.of<UserBloc>(context,listen: false).add(
                        EditUser(
                            fname: txtfirstname.text,
                            gender: gender,
                            telephone: telephone + txttelephone.text,
                            imgid: widget.user?.imgid!.id,
                            userid: widget?.user?.id.toString(),
                            lastname: txtlname.text,
                            username: txtusername.text
                        ));
                    print("Event Edit");
                  },

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.check),
                  )),
            )
          ],


          elevation: 0),
      body: SafeArea(
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            print(state);
            // TODO: implement listener}
            if(state is LoadingUserDone) {
              print("Edit Profile has been updated");
              Navigator.pop(context);


              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile has been updated")));

              });

            }

            if(state is LoadingUser){
              Center(
                child: CircularProgressIndicator(),
              );

            }

          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),

                    child: Center(

                      child: Column(
                        children: [
                          widget.user?.imgid?.images == null ?
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: Color(0xffF0F0F0),
                            child: Icon(Icons.add, size: 30,
                              color: Colors.black.withOpacity(0.5),),


                          ) :
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: Color(0xffF0F0F0),
                            backgroundImage: NetworkImage(
                                '${ApiUrl.main}${widget.user?.imgid?.images }'),
                            child: Icon(Icons.add, size: 30,
                              color: Colors.black.withOpacity(0.5),),


                          )

                          ,
                          SizedBox(height: 11,),
                          Text('Edit profile or avatar', style: TextStyle(
                            fontSize: 12.8,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400

                          ),)
                        ],
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
                    margin: EdgeInsets.only(top: 15),
                    child: TextField(
                      style: TextStyle(

                          fontSize: 13
                      ),

                      onSubmitted: (value) {
                        setState(() {
                          txtlname.text = value;
                        });
                      },
                      cursorColor: Colors.grey,
                      controller: txtlname,
                      onTap: () {

                      },
                      decoration: InputDecoration(
                          filled: true,

                          fillColor: Color(AppColorConfig.bgfill),
                          label: Text("Lastname"),
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
                    margin: EdgeInsets.only(top: 15),
                    child: TextField(
                      style: TextStyle(

                          fontSize: 13
                      ),
                      controller: txtfirstname,

                      onSubmitted: (value) {
                        setState(() {
                          txtfirstname.text = value;
                        });
                      },

                      onTap: () {

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

                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: Color(0xffF1F1F1),
                      borderRadius: BorderRadius.circular(6),

                    ),
                    child: DropdownButton(
                      elevation: 0,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 0),
                      underline: SizedBox(),


                      // Initial Value
                      value: gender,


                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      alignment: Alignment.center,
                      isExpanded: true,
                      style: TextStyle(
                          fontSize: 12.8, color: Colors.black,
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
                          gender = value!;
                        });
                      },
                      // After selecting the desired option,it will
                      // change button value to selected value


                    ),
                  ),

                  Container(
                    height: 45,
                    margin: EdgeInsets.only(top: 15),
                    child: TextField(
                      style: TextStyle(

                          fontSize: 13
                      ),
                      controller: txtusername,

                      onSubmitted: (value) {
                        setState(() {
                          txtusername.text = value;
                        });
                      },

                      onTap: () {

                      },
                      decoration: InputDecoration(
                          filled: true,

                          fillColor: Color(AppColorConfig.bgfill),
                          label: Text("Username"),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //TODO form here

                      Container(

                        margin: EdgeInsets.only(top: 25, bottom: 15),
                        child: TextField(
                          readOnly: true,

                          style: TextStyle(
                              fontSize: 13
                          ),

                          onTap: () =>
                              showCountryPicker(
                                context: context,
                                useSafeArea: true,

                                countryListTheme: CountryListThemeData(
                                    backgroundColor: Colors.white,
                                    bottomSheetHeight: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.9,
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
                                          borderRadius: BorderRadius.circular(
                                              7),
                                          borderSide: BorderSide.none
                                      ),
                                      floatingLabelStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.5)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              7),
                                          borderSide: BorderSide(
                                              color: Colors.black
                                          )
                                      ),

                                      fillColor: Color(AppColorConfig.bgfill),


                                    )
                                ),
                                showPhoneCode: true,
                                // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  print(
                                      'Select country: ${country.displayName}');
                                  setState(() {
                                    countries = country.name;
                                    telephone = country.phoneCode;
                                  });
                                },
                              ),
                          decoration: InputDecoration(
                              hintText: countries ?? 'Country',

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
                                    hintText: telephone ?? '+000',

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


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setUserBinding(UserModel user) {
    txtemail.text = user!.email!;

    txtfirstname.text = user!.firstname!;
    txtlname.text = user!.lastname!;
    txtusername.text = user!.username!;
    gender = user!.gender!;
    print(user!.telephone!.substring(0, 4));
    telephone = user!.telephone!.substring(0, 4);
    txttelephone.text = user!.telephone!.substring(4);
  }
}
