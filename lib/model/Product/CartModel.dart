import 'package:ecommerce/model/Product/ProductModel.dart';

class CartItem{
  var productid;
  int? qty;
  var producttitle;
  var imgurl;
  var price;
  Attribution? attribution;
  var discount;
  var colorid;
  var imgid;

  CartItem({this.productid, this.qty, this.producttitle, this.imgurl, this.price,
      this.attribution, this.discount,this.colorid,this.imgid});
}

class CartModel {
  List<CartItem> _item =[];

  List<CartItem> get item => _item;


}