
import 'dart:io';

import 'package:ecommerce/res/appurl/appurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkApiService {
      var url ='${ApiUrl.userloginurl}';
     Future<dynamic> AuthUser(String? email,String? password) async {

        try{
          var res = await http.post(Uri.parse(url),
              body: {
                "email":"${email}",
                "password":"${password}"
              }
          );
          // print(res.statusCode);
          print(res.body.toString());
          if (res.statusCode == 200 ) {
           return json.decode(res.body);
           print(res.body);
          }
          if(res.statusCode == 401) {
            return json.decode(res.body);
          }
          else{
            print("Error during communication");
          }



        }on SocketException {
            print("No internet during communication");
        }
     }
     // Future<dynamic> AuthVerify(String? email,String? password) async {
     //
     //   try{
     //     var res = await http.post(Uri.parse("http://192.168.100.5:8000/auth/login"),
     //         body: {
     //           "email":"Nightpp19@gmail.com",
     //           "password":"1"
     //         }
     //     );
     //     print(res.statusCode);
     //     print(res.body.toString());
     //     if (res.statusCode == 200 ) {
     //       return json.decode(res.body);
     //       print(res.body);
     //     }
     //     else{
     //       print("Error during communication");
     //     }
     //
     //
     //
     //   }on SocketException {
     //     print("No internet during communication");
     //   }
     // }

     Future<dynamic> AuthSignUpUser(fname,lname,String? email,String? password,String? telephone,username) async {

       try{
         // print("Register user");
         print(telephone);
         var res = await http.post(Uri.parse(ApiUrl.authsignup),

             body:{


               "firstname":fname,
               "lastname":lname,
               "email":email,
               "password":password,
               "telephone":"+855965689895",
               "username":username
             }
         );
         print(res.statusCode);
         // print(res.body.toString());
         if (res.statusCode == 201 ) {
           return json.decode(res.body);
           print(res.body);
         }
         else{
           print("Error during communication");
         }



       }on SocketException {
         print("No internet during communication");
       }
     }

     Future<dynamic> GetAllproduct(url,search) async {

       try{
         print(search);
         var res = await http.get(Uri.parse("${url}"),

         );
         print(res.statusCode);
         print(res.body.toString());
         if (res.statusCode == 200 ) {
           return json.decode(res.body);

         }
         else{
           print("Error during communication");
         }



       }on SocketException {
         print("No internet during communication");
       }
     }
      Future<dynamic> Searchproduct(url,search) async {

        try{
          var res = await http.get(Uri.parse('${url}?search=${search}'),

          );
          print(res.statusCode);
          print(res.body.toString());
          if (res.statusCode == 200 ) {
            return json.decode(res.body);

          }
          else{
            print("Error during communication");
          }



        }on SocketException {
          print("No internet during communication");
        }
      }
     Future<dynamic> GetAllCategory(url) async {

       try{
         var res = await http.get(Uri.parse(url),

         );
         print(res.statusCode);
         print(res.body.toString());
         if (res.statusCode == 200 ) {
           return json.decode(res.body);

         }
         else{
           print("Error during communication");
         }



       }on SocketException {
         print("No internet during communication");
       }
     }
}