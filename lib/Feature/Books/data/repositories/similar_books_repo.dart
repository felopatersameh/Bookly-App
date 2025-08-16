import 'package:bookly/Core/Utils/Entities/book_entities.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/Utils/Errors/failure.dart'; //dart pub add dartz

abstract class SimilarBooksRepo {
  Future<Either<Failure, List<BookEntities>>> fetchSimilarBooks({
    required String category,
  });
}
