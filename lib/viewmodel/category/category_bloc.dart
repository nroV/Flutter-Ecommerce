import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../model/Category/CategoryModel.dart';
import '../../repository/Category/CategoryRepository.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepository categoryRepository =   CategoryRepository();
  CategoryBloc() : super(CategoryInitial()) {
    on<FetchCategory>((event, emit) => CategoryEventEmit(event,emit));
  }

  CategoryEventEmit(FetchCategory event, Emitter<CategoryState> emit) async{
    emit(CategoryLoading());
    try{
      var response = await  categoryRepository .FetchCategory();
      print("Category even  bloc here");
      print(response);


      emit(CategoryCompleted(category:response ));

    }catch(error) {
      print(error.toString());
      emit(CategoryError());
    }

  }
}
