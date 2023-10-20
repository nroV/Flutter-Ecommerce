import 'package:ecommerce/data/network/networkservice.dart';
import 'package:ecommerce/model/Users/MessageRegister.dart';
import 'package:ecommerce/model/Users/TokenModel.dart';
import 'package:ecommerce/model/Users/UserResponse.dart';
import 'package:ecommerce/res/appurl/appurl.dart';

import '../../model/Users/UserModel.dart';

class UserRepository {

  NetworkApiService apiService = new NetworkApiService();
  Future<dynamic> AuthUser(String? email ,String? password) async {

    try{
      var res = await apiService.AuthUser(email, password) as Map<String,dynamic>;
      print(res['data']);
      if(res['data']!=null) {
        print("data here ");
      }





      return TokenModel.fromJson(res);

      return res;



    }catch(e) {
      print(e);
     rethrow ;
    }
  }
  Future<dynamic> AuthUserSignUp(fname,lname,String? email,String? password,telephone,username,gender) async {

    try{
      var res = await apiService.AuthSignUpUser(fname,lname,email, password,telephone,username,gender);
  print(res);
      return MessageRegister.fromJson(res);

      return res;



    }catch(e) {
      print(e);
      rethrow ;
    }
  }

  Future<dynamic> FetchUser(uid) async {

    try{
      String? url = "${ApiUrl.usersingle}${uid}";
      var res = await apiService.FetchUser(url);






      return UserModel.fromJson(res);





    }catch(e) {
      print(e);
      rethrow ;
    }
  }

  // Future<dynamic> AuthVerify(String? email,String? password) async {
  //
  //   try{
  //     var res = await apiService.AuthSignUpUser(fname,lname,email, password,telephone,username);
  //
  //     return MessageRegister.fromJson(res);
  //
  //     return res;
  //
  //
  //
  //   }catch(e) {
  //     print(e);
  //     rethrow ;
  //   }
  // }
  Future<dynamic> UserEditing({fname,lname,telephone,username,gender,imgid,uid}) async {

    try{
      var url = "${ApiUrl.useredit}${uid}";
      print(url);

      print(imgid);
      var res;


        res = await apiService.UserEditing(fname, lname, telephone, username, gender,imgid,uid,url!);


      print(res);
      return UserResponse.fromJson(res);

      return res;



    }catch(e) {
      print(e);
      rethrow ;
    }
  }


}