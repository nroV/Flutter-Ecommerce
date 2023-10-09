class ApiUrl {

  static var main = "http://192.168.241.29:8000/";
  static var authlogin = "http://192.168.5.21:8000/auth/login";
  static var authsignup = "${main}/auth/register";
  static var authgoogleauth = "";
  static var producturl = "${main}product";
  static var producturlsort = "${main}product?order=desc";
  static var producturlsuperdeal = "${main}product/discount";
  static var categoryurl = "${main}category";
  static var userloginurl = "${main}/auth/login";

  static var addressurlpost = "${main}address/user/";
  static var addressuser = "${main}address/customer/";

  static var orderurl = "${main}order/product/";
  static var ordergetorder = "${main}order/";
}