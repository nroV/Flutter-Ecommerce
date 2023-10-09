
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/views/client/profile/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Address/AddressScreen.dart';
import '../../authentication/Require.dart';
import '../../order/Cart.dart';
import '../../order/GoogleMap/GoogleMapScreen.dart';
import 'package:location/location.dart';

class MyProfileScreen extends StatefulWidget {
  const  MyProfileScreen ({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  var positionlong;
  var userid;

  var positionlat;
  Future<void> currentUserLocation () async {
    var location = await Location().getLocation();
    print("User current location");
    print(location.longitude);
    print(location.latitude);

    positionlong = location.longitude;
    positionlat = location.latitude;


  }
var islogin;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckAuthorize();
  }
  void CheckAuthorize() async {
    print("print user id ");
    SharedPreferences? prefs = await SharedPreferences.getInstance();

    prefs.getInt("userid");
    prefs.getBool("islogin");
    islogin =   prefs.getBool("islogin") ?? false;
    print(   prefs!.getInt("userid"));
    userid=prefs!.getInt("userid");
  }
  void PopUpUnauthorize(BuildContext context) {

    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Login or Register",style: TextStyle(
            fontSize: 18,
            color: Color(AppColorConfig.negativecolor)
        ),),
        content: Text("Require to login first before you can make an order",style: TextStyle(
            fontSize: 12.8,
            fontWeight: FontWeight.w400,

            color: Colors.black
        ),),
        elevation: 0,
        actions: [
          ElevatedButton(

              onPressed: () {
                print('press press');
                Navigator.pop(context);

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor:Color(AppColorConfig.negativecolor),
                  elevation: 0,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black.withOpacity(0.14)),
                      borderRadius: BorderRadius.circular(3)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(width: 10,),
                  Text("Login",style: TextStyle(
                    fontSize: 12.8,

                  ),)
                ],
              ))
        ],
      );
    },);
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

          title:Text("My Account",style: TextStyle(
              color: Colors.black
          ),),
          iconTheme: IconThemeData(
              color: Colors.black
          ),

          backgroundColor: Colors.white.withOpacity(0.34),
          elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //TODO top profile detail
              Container(
                margin  : EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffC2E5DF),
                  borderRadius: BorderRadius.circular(10)
                ),
                child:  Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:NetworkImage('https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1972&q=80'),


                      ),
                      title: Text('Sovanpanha',style: TextStyle(
                        color: Colors.black
                      ),),
                      subtitle: Text('Customer Since Nov, 2020',style: TextStyle(
                        fontSize: 12.8
                      ),),
                      trailing: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                fullscreenDialog: true,

                                builder: (context) {
                            return EditingProfile();
                          },));
                        },


                          child: Icon(Icons.settings)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Row(
                        children: [
                          Icon(Icons.mail,size: 16,),
                          SizedBox(width: 10,),
                          Text('Nightpp19@gmail.com',style:
                          TextStyle(fontSize: 12.8),)
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 22,bottom: 19),
                      child: Row(
                        children: [
                          Icon(Icons.phone,size: 16,),
                          SizedBox(width: 10,),
                          Text('+855 965689896',style:
                          TextStyle(fontSize: 12.8),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              //TODO profile Setting

              Container(
                margin  : EdgeInsets.all(10),
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10)
                ),
                child:  Column(
                  children: [
                    ListTile(

                      leading:Image.asset('assets/logo/Location.png',
                        fit: BoxFit.cover,
                        width: 24,
                        height: 24,


                        alignment: Alignment.center,

                      ),

                      title: Text('Address',style: TextStyle(
                          color: Colors.black
                      ),),

                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),
                      onTap: () async {
                          Navigator.push(context, MaterialPageRoute(builder:(context) {
                              return AddressProductScr(userid: userid,);
                          }, ));
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading:Image.asset('assets/logo/Wallet.png',
                        fit: BoxFit.cover,
                        width: 24,
                        height: 24,


                        alignment: Alignment.center,

                      ),

                      title: Text('Payment Method',style: TextStyle(
                          color: Colors.black
                      ),),

                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),
                    ),
                    Divider(),
                    ListTile(

                    onTap: () {
                      if(islogin == true){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return  CartScreen();
                        },));
                      }
                      if(islogin == false ){
                        PopUpUnauthorize(context);
                      }

                    },
                      leading:Image.asset('assets/logo/Ticket.png',
                        fit: BoxFit.cover,
                        width: 24,
                        height: 24,


                        alignment: Alignment.center,

                      ),

                      title: Text('My Cart',style: TextStyle(
                          color: Colors.black
                      ),),

                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {


                      },
                      leading:Image.asset('assets/logo/Favorite_fill.png',
                        fit: BoxFit.cover,
                        width: 24,
                        height: 24,


                        alignment: Alignment.center,

                      ),

                      title: Text('My WishList',style: TextStyle(
                          color: Colors.black
                      ),),

                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),
                    ),
                    Divider(),
                    ListTile(
                      leading:Image.asset('assets/logo/eye.png',
                        fit: BoxFit.cover,
                        width: 24,
                        height: 24,


                        alignment: Alignment.center,

                      ),

                      title: Text('Changed Password',style: TextStyle(
                          color: Colors.black
                      ),),

                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),
                    ),
                    Divider(),
                    ListTile(
                      leading:Image.asset('assets/logo/volume-2.png',
                        fit: BoxFit.cover,
                        width: 24,
                        height: 24,


                        alignment: Alignment.center,

                      ),

                      title: Text('Report Bug and Issues',style: TextStyle(
                          color: Colors.black
                      ),),

                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        clearalltoken();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                          return RequireLoginandSignup ();
                        },),(route) => false,);
                      },
                      leading:Image.asset('assets/logo/Logout.png',
                        fit: BoxFit.cover,
                        width: 24,
                        height: 24,


                        alignment: Alignment.center,

                      ),

                      title: Text('Log Out',style: TextStyle(
                          color: Colors.black
                      ),),

                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  void clearalltoken() async{

    SharedPreferences  prefs = await SharedPreferences.getInstance();
    print("key removed ");
    // prefs.setBool("islogin",true);
    // prefs.setString("userid", userid);
    prefs?.remove("islogin");

    prefs?.remove("userid");
  }
}
