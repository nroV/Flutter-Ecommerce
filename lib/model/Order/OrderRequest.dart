class OrderRequestV2 {
  String? method;
  List<Productss>? products;
  int? customer;

  OrderRequestV2({this.method, this.products, this.customer});

  OrderRequestV2.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    if (json['products'] != null) {
      products = <Productss>[];
      json['products'].forEach((v) {
        products!.add(new Productss.fromJson(v));
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

class Productss {
  int? id;
  int? quantity;
  int? colorselection;
  int? size;

  Productss({this.id, this.quantity, this.colorselection, this.size});

  Productss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    colorselection = json['colorselection'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['colorselection'] = this.colorselection;
    data['size'] = this.size;
    return data;
  }
}
