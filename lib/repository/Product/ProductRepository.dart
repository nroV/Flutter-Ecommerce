import 'package:ecommerce/data/network/networkservice.dart';
import 'package:ecommerce/model/Users/MessageRegister.dart';
import 'package:ecommerce/model/Users/TokenModel.dart';
import 'package:ecommerce/res/appurl/appurl.dart';

import '../../model/Product/ProductModel.dart';

class ProductRepository {
  var url =ApiUrl.producturl;
  NetworkApiService apiService = new NetworkApiService();
  Future<dynamic> FetchProduct() async {

    try{

      //
      // if(sort == true) {
      //
      //   var res = await apiService.GetAllproduct(ApiUrl.producturlsort);
      //   return ProductModel.fromJson(res);
      // }

        print("New Arrival");
        var res = await apiService.GetAllproduct(ApiUrl.producturl,"");
        return ProductModel.fromJson(res);





      // return TokenModel.fromJson(res);




    }catch(e) {
      print(e);
      rethrow ;
    }
  }

  Future<dynamic> QueryProduct(search) async {

    try{


      print("Query Product In Repository");
      var res = await apiService.Searchproduct(ApiUrl.producturl,search);
      return ProductModel.fromJson(res);





      // return TokenModel.fromJson(res);




    }catch(e) {
      print(e);
      rethrow ;
    }
  }
  Future<dynamic> FetchProductDiscount() async {

    try{

        print("discount");
        var res = await apiService.GetAllproduct(ApiUrl.producturlsuperdeal,"");
        return ProductModel.fromJson(res);







      // return TokenModel.fromJson(res);




    }catch(e) {
      print(e);
      rethrow ;
    }
  }


}