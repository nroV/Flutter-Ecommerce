import 'OrderReq.dart';

class OrderRequestV2 {
  String? method;
  List<Productss>? products;
  var customer;

  OrderRequestV2({this.method, this.products, this.customer});
}

class Productss {
  int? id;
  int? quantity;

  Productss({this.id, this.quantity});
  Map<String, dynamic> toJson() => {
    'id': id,
    'quantity': quantity,
  };

}