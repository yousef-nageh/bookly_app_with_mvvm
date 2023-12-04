
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../home_model/BooksModel.dart';

abstract class HomeRepo{
Future<Either<Failure,BooksModel>> getUpperBooks();
Future<Either<Failure,BooksModel>> getLowerBooks();
Future<Either<Failure,BooksModel>> geSearchBooks({ required String item});

}