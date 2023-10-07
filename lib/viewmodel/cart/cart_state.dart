part of 'cart_bloc.dart';




class AllCart {

  List<CartItem>? itemcart =[];


  AllCart({this.itemcart});


  @override
  // TODO: implement props
  List<Object?> get props => [itemcart];

  void InsertToCart(CartItem item){
    itemcart!.add(item);

  }
}
class InitState extends AllCart {
  InitState():super(itemcart: []);
}
