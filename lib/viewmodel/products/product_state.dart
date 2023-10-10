part of 'product_bloc.dart';


abstract class ProductState extends Equatable{

}
class ProductInitialSearch extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class ProductInitial extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class ProductCompleted extends ProductState {
 ProductModel? product;


  ProductCompleted({this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];

}

class ProductSerachCompleted extends ProductState {
  ProductModel? product;


  ProductSerachCompleted({this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];

}
class ProductDiscountCompleted extends ProductState {
  ProductModel? product;


  ProductDiscountCompleted({this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];

}
class ProductLoading extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProductSearchLoading extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProductSearchError extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProductError extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProductLoadingDiscount extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class ProductErrorDiscount extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
