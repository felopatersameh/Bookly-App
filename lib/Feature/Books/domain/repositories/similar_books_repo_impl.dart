import 'package:bookly/Core/Utils/Entities/book_entities.dart';
import 'package:bookly/Core/network/app_end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/Utils/Errors/failure.dart';
import '../../../../Core/Utils/Models/book_model.dart';
import '../../../../Core/network/dio.dart';
import '../../data/repositories/similar_books_repo.dart';

class SimilarBooksRepoImpl extends SimilarBooksRepo {
  @override
  Future<Either<Failure, List<BookEntities>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      // print("15-category: $category");
      var data = await DioHelper.getData(
        path: '${AppEndPoint.similarBooks}$category',
      );
      List<BookModel> books = [];
      for (final item in data.data["items"]) {
        if (item != null) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure.fromResponse(e.hashCode, e));
      }
    }
  }
}
