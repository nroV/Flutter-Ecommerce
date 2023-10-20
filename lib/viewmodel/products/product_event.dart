part of 'product_bloc.dart';


abstract class ProductEvent
{}


class FetchProduct extends ProductEvent {

}
class ProductFilter extends ProductEvent {
  var search;
  var min;
  var max;
  var category;
  var sortby;
  var rank;

  ProductFilter( {this.min, this.max, this.category, this.sortby,this.search,this.rank});
}

class SortProduct extends ProductEvent {
var sortname ;
var rank;
var title;

SortProduct( {this.sortname, this.rank ,this.title});
}

class SortProductSearch extends ProductEvent {
  var sortname ;
  var rank;
  var title;

  SortProductSearch( {this.sortname, this.rank ,this.title});
}
class DiscountProduct extends ProductEvent {

}

class PutProduct extends ProductEvent {

}

class GetProduct extends ProductEvent {

}

class DeleteProduct extends ProductEvent {

}

class QueryProduct extends ProductEvent {
  var search;

  QueryProduct(this.search);
}