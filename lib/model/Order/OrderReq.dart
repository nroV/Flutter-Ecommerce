class OrderRequest {
  String? method;
  List<Products>? products;
  int? customer;

  OrderRequest({this.method, this.products, this.customer});

  OrderRequest.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    customer = json['customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['customer'] = this.customer;
    return data;
  }
}

class Products {
  int? id;
  int? quantity;

  Products({this.id, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    return data;
  }
}
