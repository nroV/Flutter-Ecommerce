class ApiUrl {

  static var main = "http://192.168.100.5:8000/";
  static var authlogin = "${main}auth/login";
  static var authsignup = "${main}/auth/register";
  static var authgoogleauth = "";
  static var producturl = "${main}product";
  static var producturlsort = "${main}product?order=desc";
  static var producturlsuperdeal = "${main}product/discount";
  static var categoryurl = "${main}category";
  static var userloginurl = "${main}/auth/login";
  static var usersingle = "${main}auth/user/";
  static var useredit = "${main}auth/update/";
  static var addressurlpost = "${main}address/user/";
  static var addressuser = "${main}address/customer/";

  static var orderurl = "${main}order/product/";
  static var ordergetorder = "${main}order/";


  static var orderuserurl = '${main}order/user/';
}