import 'package:bookly/Feature/Research/data/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/Utils/Errors/failure.dart';
import '../../../../Core/Utils/Entities/book_entities.dart';

class SearchUseCase {
  SearchRepo searchRepo;
  SearchUseCase(this.searchRepo);
  Future<Either<Failure, List<BookEntities>>> execute({
    required String category,
  }) {
    return searchRepo.search(category: category);
  }
}
