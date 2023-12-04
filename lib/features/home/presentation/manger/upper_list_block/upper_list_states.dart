import '../../../data/models/home_model/BooksModel.dart';


abstract class UpperListStates{}

class StartState extends UpperListStates{}

class GetUpperListWaitingState extends UpperListStates{}

class GetUpperListSuccessState extends UpperListStates{

  final BooksModel upperBooks;

  GetUpperListSuccessState(this.upperBooks);
}

class GetUpperListErrorState extends UpperListStates{

  final String errorMessage;

  GetUpperListErrorState(this.errorMessage);
}

