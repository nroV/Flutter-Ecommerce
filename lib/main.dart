import 'package:ecommerce/provider/AppProvider.dart';
import 'package:ecommerce/res/constant/appcolor.dart';
import 'package:ecommerce/viewmodel/User/user_bloc.dart';
import 'package:ecommerce/viewmodel/authlogin/login_bloc.dart';
import 'package:ecommerce/viewmodel/authlogin/register_bloc.dart';
import 'package:ecommerce/viewmodel/cart/cart_bloc.dart';
import 'package:ecommerce/viewmodel/category/category_bloc.dart';
import 'package:ecommerce/viewmodel/order/order_bloc.dart';
import 'package:ecommerce/viewmodel/products/address_bloc.dart';
import 'package:ecommerce/viewmodel/products/product_bloc.dart';
import 'package:ecommerce/views/authentication/Require.dart';
import 'package:ecommerce/views/authentication/Register.dart';
import 'package:ecommerce/views/authentication/LoginScreen.dart';
import 'package:ecommerce/views/client/Home.dart';
import 'package:ecommerce/views/client/NavScreen.dart';
import 'package:ecommerce/views/splashscreen/screen1.dart';
import 'package:ecommerce/views/splashscreen/screen2.dart';
import 'package:ecommerce/views/splashscreen/screen3.dart';
import 'package:ecommerce/views/splashscreen/starter.dart';
import 'package:ecommerce/views/testpayment.dart';
import 'package:ecommerce/views/widget/auth/customlogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'model/Splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  Stripe.publishableKey= "pk_test_51LkUHQEQYj9biXMEOOThfjk5F8FszV5tPpXQSHEhP1kOZ1y0IF2yUOV1yGo75VyxVEhJ85modX9W4AtdKjc7T8eL00Edj2wBlz";
}

class MyApp extends StatefulWidget {

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var textthem =   TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w500
    ),
    displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white
    ),
    headlineSmall: TextStyle(
      fontSize: 12,
      color: Color(AppColorConfig.success)
    ),

    labelSmall: TextStyle(
      fontSize: 12.8,
      color: Colors.grey
    ),

    labelLarge: TextStyle(
      fontSize: 16,

    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500
    ),
    titleSmall: TextStyle(
      fontSize: 12.8,
      fontWeight: FontWeight.w500,
      color: Colors.black
    )
  );
  SharedPreferences? prefs;
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }

  Widget build(BuildContext context) {
    setPreference();
    return MultiBlocProvider(

      providers: AppProvider.allblocprovider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce',
        theme: ThemeData(
          primarySwatch:Colors.green,
         primaryIconTheme: IconThemeData(
           color: Color(AppColorConfig.primarycolor)
         ),
         primaryColor: Colors.black,
        fontFamily: 'Poppins',

         primaryTextTheme: TextTheme(

         ),
         textTheme:textthem,

          colorScheme: ColorScheme.fromSeed(seedColor:Color( AppColorConfig.primarycolor)),

        ),
        // initialRoute: '/',
        //
        // routes: {
        //   '/loginandregister':(context)=>RequireLoginandSignup(),
        //   '/splash':(context)=>StartScreen(apptitle: "Start",),
        //   '/':(context)=>
        //       prefs?.getBool("islogin") == false  ?
        //       MyNavScreen () : RequireLoginandSignup()
        // },
        // home  : RequireLoginandSignup(),
        home:
        prefs?.getString("token")  == null  ?
        RequireLoginandSignup() :

        MyNavScreen() ,


      ),
    );
  }

  void setPreference() async{
   prefs = await SharedPreferences.getInstance();
  print("Starting");
   print(prefs?.getBool("islogin"));
 print("User id: ${  prefs!.getInt("userid")}");
   prefs!.getString('token');
   print( prefs!.getString('token'));
   // prefs!.remove("token");
   // prefs!.remove("userid");
  }
}





