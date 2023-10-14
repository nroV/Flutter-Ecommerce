import 'package:ecommerce/model/Category/ProductCategory.dart';
import 'package:ecommerce/model/Product/ProductModel.dart';

class CartItem{
  var productid;
  int? qty;
  var producttitle;
  var imgurl;
  var price;
  var sizetext;
  Attribution? attribution;
  AttributionCategory? attributionv2;
  var discount;
  var colorid;
  var imgid;
  var sizeid;

  CartItem({this.productid, this.qty, this.producttitle, this.imgurl, this.price,
    this.attributionv2,
      this.attribution, this.discount,this.colorid,this.imgid,this.sizeid,this.sizetext });
}

class CartModel {
  List<CartItem> _item =[];

  List<CartItem> get item => _item;


}