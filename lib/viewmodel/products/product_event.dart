part of 'product_bloc.dart';


abstract class ProductEvent
{}


class FetchProduct extends ProductEvent {

}

class SortProduct extends ProductEvent {

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