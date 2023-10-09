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

  void removeFromCart(CartItem item){
    itemcart!.removeWhere((element) => element == item);
  }
}
class InitState extends AllCart {
  InitState():super(itemcart: []);
}
