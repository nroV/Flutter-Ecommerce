class ApiUrl {

  static var main = "http://192.168.96.1:8000/";
  static var authlogin = "${main}auth/login";
  static var authsignup = "${main}/auth/register";

  static var authgoogleauthregister = "${main}/auth/google/register";

  static var authlogingoogle = "${main}/auth/google/login";
  static var producturl = "${main}product";
  static var producturlsort = "${main}product?order=desc";
  static var producturlsuperdeal = "${main}product/discount";
  static var categoryurl = "${main}category";
  static var userloginurl = "${main}/auth/login";
  static var usersingle = "${main}auth/user/";
  static var useredit = "${main}auth/update/";
  static var addressurlpost = "${main}address/user/";
  static var addressurlput = "${main}address";
  static var addressuser = "${main}address/customer/";
  static var reviewurl = "${main}review/product/";
  static var reviewpro = "${main}review/pro/";
  static var orderurl = "${main}order/product/";
  static var ordergetorder = "${main}order/";

  static var filterproduct ="${main}/product?min_price=0&max_price=0&category=1";
  static var imagepost = "${main}image";



  static var orderuserurl = '${main}order/user/';

  static var addproductfavurl ='${main}product/favorite';
  static var removeproductfavurl='${main}product/favorite';
}