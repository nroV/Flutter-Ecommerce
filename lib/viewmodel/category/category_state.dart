part of 'category_bloc.dart';


abstract class CategoryState extends Equatable{}

class CategoryInitial extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class CategoryLoading extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}
class CategoryCompleted  extends CategoryState {

  CartegoryModel? category;


  CategoryCompleted({this.category});

  @override
  // TODO: implement props
  List<Object?> get props =>[category];


}
class CategoryError extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}

class CategoryByidCompleted  extends CategoryState {

  CategoryProduct? product;


  CategoryByidCompleted({this.product});

  @override
  // TODO: implement props
  List<Object?> get props =>[product];


}



class  CategoryByidError  extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}



class  CategoryByidLoading  extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];


}




