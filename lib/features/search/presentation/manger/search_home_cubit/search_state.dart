

import 'package:bookly_app_with_mvvm/features/home/data/models/home_model/BooksModel.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchWaitingState extends SearchState {}
class SearchSuccessState extends SearchState {

  final BooksModel model;

  SearchSuccessState(this.model);
}
class SearchErrorState extends SearchState {

  final String errorMassage;

  SearchErrorState(this.errorMassage);
}

