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



        print("New Arrival");
        var res = await apiService.GetAllproduct(ApiUrl.producturl,"");
        return ProductModel.fromJson(res);





      // return TokenModel.fromJson(res);




    }catch(e) {
      print(e);
      rethrow ;
    }
  }
  Future<dynamic> SortProduct(sort,rank,{search}) async {

    try{


      var res;

      print(ApiUrl.producturl);
      print(sort);
      print(rank);
      print(search);

       res = await apiService.Sortproduct(ApiUrl.producturl,sort,rank ,search: search );

      // print(res);

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


  Future<dynamic> QueryProductFilter(search,{cid,maxprice,minprice,sort,rank}) async {

    try{


      print("Filter Product In Repository");
      var res = await apiService.FilterProduct(ApiUrl.producturl,search,

          cid: cid,

      maxprice: maxprice,
        minprice: minprice,
        sort: sort,
        rank: rank

      );
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