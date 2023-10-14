
import 'dart:io';

import 'package:ecommerce/model/Address.dart';
import 'package:ecommerce/res/appurl/appurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/Order/OrderReq.dart';
import '../../model/Order/OrderRequest.dart';
class NetworkApiService {
  var url = '${ApiUrl.userloginurl}';

  Future<dynamic> AuthUser(String? email, String? password) async {
    try {
      var res = await http.post(Uri.parse(url),
          body: {
            "email": "${email}",
            "password": "${password}"
          }
      );
      // print(res.statusCode);
      print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
        print(res.body);
      }
      if (res.statusCode == 401) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }
  Future<dynamic> FetchUser(String? url) async {
    try {
      var res = await http.get(Uri.parse(url!));
      // print(res.statusCode);
      print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
        print(res.body);
      }
      if (res.statusCode == 401) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
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

  Future<dynamic> AuthSignUpUser(fname, lname, String? email, String? password,
      String? telephone, String? username,String gender) async {
    try {
      // print("Register user");
      print(telephone);
      var tel = "+" + telephone.toString();
          var res = await http.post(Uri.parse(ApiUrl.authsignup),


          body: {


            "firstname": fname,
            "lastname": lname,
            "email": email,
            "username":username,
            "password": password,
            "telephone": tel,
            "gender": gender,
            "username": username
          }
      );
      print(res.statusCode);
      print(res.body.toString());
      if (res.statusCode == 201) {
        return json.decode(res.body);
        print(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }

  Future<dynamic> UserEditing(fname, lname, String? telephone, String? username,String gender,imgid,uid,url) async {
    try {
      // print("Register user");
      print(telephone);
      var tel = telephone.toString();
      print(tel);
      var res = await http.put(Uri.parse(url),


          body: {
            "username": "${username}",
            "firstname": "${fname}",
            "lastname": "${lname}",
            "telephone": "${tel}",
            "gender": "${gender}",
            "imgid": "${imgid}"
          }
      );
      print(res.statusCode);
      print(res.body.toString());
      if (res.statusCode == 201) {
        return json.decode(res.body);
        print(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }
  Future<dynamic> GetAllproduct(url, search) async {
    try {
      print(search);
      var res = await http.get(Uri.parse("${url}"),

      );
      print(res.statusCode);
      // print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }
  Future<dynamic> Sortproduct(url, sort,rank,{search}) async {
    try {
      print(url);
      print(sort);
      print("${url}/sort?${sort}=${rank}");
      if(search == null) {
        search = "";
      }
    var mainurl;

        mainurl = "${url}/sort?search=${search}&${sort}=${rank}";

      print(mainurl);

      var res = await http.get(Uri.parse(mainurl),

      );
      print(res.statusCode);
      // print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }
  Future<dynamic> Searchproduct(url, search) async {
    try {
      var res = await http.get(Uri.parse('${url}?search=${search}'),

      );
      print(res.statusCode);
      // print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }


  Future<dynamic> AddressPost(String? url, AddressBody addressbody, uid) async {
    try {
      print(addressbody);

      var res = await http.post(Uri.parse('${url}${uid}'),
        body: {
          "street": addressbody.street,
          "city": addressbody.country,
          "latitude": addressbody.lat.toString(),
          "longitude": addressbody.lon.toString(),
          "country": addressbody.country
        },
        //     headers: {
        //       'Content-type': 'application/json',
        //       'Accept': 'application/json'
        //       // "Authorization": "Some token"
        //
        // }
      );
      // print(res.statusCode);
      print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
        print(res.body);
      }
      if (res.statusCode == 401) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }

  Future<dynamic> AddressFetch(uid) async {
    try {
      var url = ApiUrl.addressuser;

      var res = await http.get(Uri.parse('${url}${uid}'),
        //     headers: {
        //       'Content-type': 'application/json',
        //       'Accept': 'application/json'
        //       // "Authorization": "Some token"
        //
        // }
      );
      // print(res.statusCode);
      // print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
        print(res.body);
      }
      if (res.statusCode == 401) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }

  Future<dynamic> GetAllCategory(url) async {
    try {

      var res = await http.get(Uri.parse(url),

      );
      print(res.statusCode);
      // print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }
  Future<dynamic> GetProductCategory(url) async {
    try {
      var res = await http.get(Uri.parse(url),

      );
      print(res.statusCode);
      // print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }
  Future<dynamic> GetOrderSummary(url,oid) async {
    try {
      print(url);
      print(oid);
      var urlhere = "${url}${oid}";
      print(urlhere);
      var res = await http.get(Uri.parse('${urlhere}'),

      );
      print(res.statusCode);
      // print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }

  Future<dynamic> GetOrderUser(url,uid) async {
    try {
      print(url);
      print(uid);
      var urlhere = "${url}${uid}";
      print(urlhere);
      var res = await http.get(Uri.parse('${urlhere}'),

      );
      print(res.statusCode);
      // print(res.body.toString());
      if (res.statusCode == 200) {
        return json.decode(res.body);
      }
      else {
        print("Error during communication");
      }
    } on SocketException {
      print("No internet during communication");
    }
  }

  Future<dynamic> PostOrder(String? url, addressid, OrderRequestV2? orderRequestV2) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'csrftoken=5jwKWckjCPQiV1By2uxkB39vNJaaWult'
    };
    var request = http.Request('POST', Uri.parse('${url}${addressid}'));

    if (url == null || addressid == null || orderRequestV2 == null) {
      // Handle the error here
      print("Null error");
      return;
    }
    List<Map<String, dynamic>> jsonList = orderRequestV2!.products!.map((item) => item.toJson()).toList();

    print(jsonList);
    request.body = json.encode({
      "method":'${orderRequestV2?.method}',
     "products": jsonList.toList(),
      "customer": '${orderRequestV2.customer}'
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    // print(await response.stream.bytesToString());
    print(response.statusCode);
    if (response.statusCode == 201) {
      var res = await response.stream.bytesToString();


      return json.decode(res);
    }
    else {
      print(response.reasonPhrase);
    }

    // print(orderRequestV2);
    //       var res = await http.post(Uri.parse('${url}${addressid}'),
    //         body: {
    //           "method":'cash',
    //           "products": "${orderRequestV2?.products}",
    //           "customer": "${orderRequestV2?.customer}"
    //         },
    //         //     headers: {
    //         //       'Content-type': 'application/json',
    //         //       'Accept': 'application/json'
    //         //       // "Authorization": "Some token"
    //         //
    //         // }
    //       );
    //       // print(res.statusCode);
    //       print(res.body.toString());
    //       if (res.statusCode == 200 ) {
    //         return json.decode(res.body);
    //         print(res.body);
    //       }
    //       if(res.statusCode == 401) {
    //         return json.decode(res.body);
    //       }
    //       else{
    //         print("Error during communication");
    //       }
    //
    //
    //
    //     }
  }


}


