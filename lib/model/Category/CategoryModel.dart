class CartegoryModel {
  List<Results>? results;

  CartegoryModel({this.results});

  CartegoryModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? categoryname;
  List<Product>? product;
  Imgid? imgid;

  Results({this.id, this.categoryname, this.product, this.imgid});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryname = json['categoryname'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    imgid = json['imgid'] != null ? new Imgid.fromJson(json['imgid']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryname'] = this.categoryname;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    if (this.imgid != null) {
      data['imgid'] = this.imgid!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? productname;
  double? price;
  int? stockqty;
  double? avgRating;
  int? discount;
  int? sellRating;
  int? category;
  int? owner;
  List<int>? imgid;

  Product(
      {this.id,
        this.productname,
        this.price,
        this.stockqty,
        this.avgRating,
        this.discount,
        this.sellRating,
        this.category,
        this.owner,
        this.imgid});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productname = json['productname'];
    price = json['price'];
    stockqty = json['stockqty'];
    avgRating = json['avg_rating'];
    discount = json['discount'];
    sellRating = json['sell_rating'];
    category = json['category'];
    owner = json['owner'];
    imgid = json['imgid'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productname'] = this.productname;
    data['price'] = this.price;
    data['stockqty'] = this.stockqty;
    data['avg_rating'] = this.avgRating;
    data['discount'] = this.discount;
    data['sell_rating'] = this.sellRating;
    data['category'] = this.category;
    data['owner'] = this.owner;
    data['imgid'] = this.imgid;
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
