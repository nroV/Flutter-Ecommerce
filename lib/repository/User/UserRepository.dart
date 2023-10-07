import 'package:ecommerce/data/network/networkservice.dart';
import 'package:ecommerce/model/Users/MessageRegister.dart';
import 'package:ecommerce/model/Users/TokenModel.dart';

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
  Future<dynamic> AuthUserSignUp(fname,lname,String? email,String? password,telephone,username) async {

    try{
      var res = await apiService.AuthSignUpUser(fname,lname,email, password,telephone,username);

      return MessageRegister.fromJson(res);

      return res;



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


}