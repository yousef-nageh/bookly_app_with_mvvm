
import '../../../data/models/home_model/BooksModel.dart';

abstract class LowerListStates {}

class LowerListInitial extends LowerListStates {}

class GetLowerListWaitingState extends LowerListStates{}

class GetLowerListSuccessState extends LowerListStates{

  final BooksModel lowerBooks;

  GetLowerListSuccessState(this.lowerBooks);
}

class GetLowerListErrorState extends LowerListStates{

  final String errorMessage;

  GetLowerListErrorState(this.errorMessage);
}
