import 'package:bookly/Feature/Books/data/repositories/similar_books_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/Utils/Errors/failure.dart';
import '../../../../Core/Utils/Entities/book_entities.dart';

class SimilarBooksUseCase {
  final SimilarBooksRepo similarBooksRepo;
  SimilarBooksUseCase(this.similarBooksRepo);
  Future<Either<Failure, List<BookEntities>>> execute({
    required String category,
  }) {
    return similarBooksRepo.fetchSimilarBooks(category: category);
  }
}
