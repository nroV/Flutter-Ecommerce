import 'package:ecommerce/data/network/networkservice.dart';
import 'package:ecommerce/model/Users/MessageRegister.dart';
import 'package:ecommerce/model/Users/TokenModel.dart';
import 'package:ecommerce/res/appurl/appurl.dart';

import '../../model/Category/CategoryModel.dart';
import '../../model/Product/ProductModel.dart';

class CategoryRepository {
  var url = ApiUrl.producturl;
  NetworkApiService apiService = new NetworkApiService();

  Future<dynamic> FetchCategory() async {
    try {
      var res = await apiService.GetAllCategory(ApiUrl.categoryurl);
      return CartegoryModel.fromJson(res);


      // return TokenModel.fromJson(res);


    } catch (e) {
      print(e);
      rethrow;
    }
  }

}
