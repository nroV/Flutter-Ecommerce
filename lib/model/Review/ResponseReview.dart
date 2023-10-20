class ResponseReview {
  int? id;
  Customer? customer;
  String? description;
  int? rating;
  String? createdAt;
  String? updatedAt;
  int? product;

  ResponseReview(
      {this.id,
        this.customer,
        this.description,
        this.rating,
        this.createdAt,
        this.updatedAt,
        this.product});

  ResponseReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    description = json['description'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product'] = this.product;
    return data;
  }
}

class Customer {
  String? username;
  String? firstname;
  String? lastname;
  String? telephone;
  String? gender;
  Imgid? imgid;

  Customer(
      {this.username,
        this.firstname,
        this.lastname,
        this.telephone,
        this.gender,
        this.imgid});

  Customer.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    telephone = json['telephone'];
    gender = json['gender'];
    imgid = json['imgid'] != null ? new Imgid.fromJson(json['imgid']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['telephone'] = this.telephone;
    data['gender'] = this.gender;
    if (this.imgid != null) {
      data['imgid'] = this.imgid!.toJson();
    }
    return data;
  }
}

class Imgid {
  int? id;
  String? images;

  Imgid({this.id, this.images});

  Imgid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['images'] = this.images;
    return data;
  }
}
