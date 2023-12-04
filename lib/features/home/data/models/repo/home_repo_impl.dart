import 'package:bookly_app_with_mvvm/core/errors/failure.dart';
import 'package:bookly_app_with_mvvm/core/utils/dio_helper.dart';
import 'package:bookly_app_with_mvvm/features/home/data/models/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../home_model/BooksModel.dart';

class HomeRepoImpl implements HomeRepo {
 final  DioHelper dioHelper;

  HomeRepoImpl(this.dioHelper);

  @override
  Future<Either<Failure, BooksModel>> getLowerBooks() async {
    try {
      var data = await dioHelper.getData(
        endPoint:
            "volumes",
        query: {
          'Filtering':'free-ebooks',
          'Sorting':'newest',
          'q':'subject  science',
        }
      );

      BooksModel booksModel = BooksModel.fromJson(data.data);
      return right(booksModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BooksModel>> getUpperBooks() async {
    try {
      var data = await dioHelper.getData(endPoint: "volumes", query: {
        'Filtering': 'free-ebooks',
        'q': 'computer science',
      });

      BooksModel booksModel = BooksModel.fromJson(data.data);
      return right(booksModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BooksModel>> geSearchBooks(
      {required String item}) async {
    try {
      var data = await dioHelper.getData(endPoint: "volumes",
        query: {
        'q':'subject$item '
        }
      );
      BooksModel booksModel = BooksModel.fromJson(data.data);
      return right(booksModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
