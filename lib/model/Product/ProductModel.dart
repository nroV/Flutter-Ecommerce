class ProductModel {
  int? pagePerQuery;
  int? pageSize;
  int? totalPages;
  int? currentPageNumber;
  List<Results>? results;

  ProductModel(
      {this.pagePerQuery,
        this.pageSize,
        this.totalPages,
        this.currentPageNumber,
        this.results});

  ProductModel.fromJson(Map<String, dynamic> json) {
    pagePerQuery = json['page_per_query'];
    pageSize = json['page_size'];
    totalPages = json['total_pages'];
    currentPageNumber = json['current_page_number'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_per_query'] = this.pagePerQuery;
    data['page_size'] = this.pageSize;
    data['total_pages'] = this.totalPages;
    data['current_page_number'] = this.currentPageNumber;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {



  int? id;
  Category? category;
  Owner? owner;
  List<Imgid>? imgid;
  String? productname;
  double? price;
  int? stockqty;
  double? avgRating;
  int? discount;
  int? sellRating;
  Attribution? attribution;
  String? description;

  Results(
      {this.id,
        this.category,
        this.owner,
        this.imgid,
        this.attribution,
        this.productname,
        this.price,
        this.stockqty,
        this.avgRating,
        this.discount,
        this.sellRating,
        this.description});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    if (json['imgid'] != null) {
      imgid = <Imgid>[];
      json['imgid'].forEach((v) {
        imgid!.add(new Imgid.fromJson(v));
      });
    }
    attribution = json['attribution'] != null
        ? new Attribution.fromJson(json['attribution'])
        : null;
    productname = json['productname'];
    price = json['price'];
    stockqty = json['stockqty'];
    avgRating = json['avg_rating'];
    discount = json['discount'];
    sellRating = json['sell_rating'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    if (this.imgid != null) {
      data['imgid'] = this.imgid!.map((v) => v.toJson()).toList();
    }
    if (this.attribution != null) {
      data['attribution'] = this.attribution!.toJson();
    }
    data['productname'] = this.productname;
    data['price'] = this.price;
    data['stockqty'] = this.stockqty;
    data['avg_rating'] = this.avgRating;
    data['discount'] = this.discount;
    data['sell_rating'] = this.sellRating;
    data['description'] = this.description;
    return data;
  }
}

class Category {
  int? id;
  String? categoryname;
  Imgid? imgid;

  Category({this.id, this.categoryname, this.imgid});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryname = json['categoryname'];
    imgid = json['imgid'] != null ? new Imgid.fromJson(json['imgid']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryname'] = this.categoryname;
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

class Owner {
  String? username;
  String? email;

  Owner({this.username, this.email});

  Owner.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}

class Attribution {
  int? id;
  List<Colorid>? colorid;
  String? size;
  double? weight;
  String? brand;
  String? model;
  String? materialName;

  Attribution(
      {this.id,
        this.colorid,
        this.size,
        this.weight,
        this.brand,
        this.model,
        this.materialName});

  Attribution.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['colorid'] != null) {
      colorid = <Colorid>[];
      json['colorid'].forEach((v) {
        colorid!.add(new Colorid.fromJson(v));
      });
    }
    size = json['size'];
    weight = json['weight'];
    brand = json['brand'];
    model = json['model'];
    materialName = json['material_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.colorid != null) {
      data['colorid'] = this.colorid!.map((v) => v.toJson()).toList();
    }
    data['size'] = this.size;
    data['weight'] = this.weight;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['material_name'] = this.materialName;
    return data;
  }
}

class Colorid {
  int? id;
  String? color;
  String? desc;

  Colorid({this.id, this.color, this.desc});

  Colorid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['desc'] = this.desc;
    return data;
  }
}
