import 'package:ecommerce/data/network/networkservice.dart';
import 'package:ecommerce/model/Users/MessageRegister.dart';
import 'package:ecommerce/model/Users/TokenModel.dart';
import 'package:ecommerce/res/appurl/appurl.dart';

import '../../model/Address.dart';
import '../../model/Address/AddressModel.dart';
import '../../model/Address/AddressRes.dart';
import '../../model/Product/ProductModel.dart';

class AddressRepository {
  var url =ApiUrl.producturl;
  NetworkApiService apiService = new NetworkApiService();
  Future<dynamic> PostAddress(AddressBody? addressBody,userid) async {

    try{

      var res = await apiService.AddressPost(ApiUrl.addressurlpost,addressBody! ,userid);
      return AddressModelResponse.fromJson(res);





      // return TokenModel.fromJson(res);




    }catch(e) {
      print(e);
      rethrow ;
    }
  }
  Future<dynamic> FetchAddress(userid) async {

    try{

      var res = await apiService.AddressFetch(userid);
      return AddressModel.fromJson(res);





      // return TokenModel.fromJson(res);




    }catch(e) {
      print(e);
      rethrow ;
    }
  }


}