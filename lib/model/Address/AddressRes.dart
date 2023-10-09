class AddressModelResponse {
  int? id;
  CustomerId? customerId;
  String? street;
  String? city;
  double? latitude;
  double? longitude;

  AddressModelResponse(
      {this.id,
        this.customerId,
        this.street,
        this.city,
        this.latitude,
        this.longitude});

  AddressModelResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'] != null
        ? new CustomerId.fromJson(json['customer_id'])
        : null;
    street = json['street'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.customerId != null) {
      data['customer_id'] = this.customerId!.toJson();
    }
    data['street'] = this.street;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class CustomerId {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? password;
  String? telephone;
  bool? isowner;
  String? lastLogin;
  bool? isActivated;
  String? gender;
  int? imgid;

  CustomerId(
      {this.id,
        this.firstname,
        this.lastname,
        this.username,
        this.email,
        this.password,
        this.telephone,
        this.isowner,
        this.lastLogin,
        this.isActivated,
        this.gender,
        this.imgid});

  CustomerId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    telephone = json['telephone'];
    isowner = json['isowner'];
    lastLogin = json['last_login'];
    isActivated = json['is_activated'];
    gender = json['gender'];
    imgid = json['imgid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['telephone'] = this.telephone;
    data['isowner'] = this.isowner;
    data['last_login'] = this.lastLogin;
    data['is_activated'] = this.isActivated;
    data['gender'] = this.gender;
    data['imgid'] = this.imgid;
    return data;
  }
}
