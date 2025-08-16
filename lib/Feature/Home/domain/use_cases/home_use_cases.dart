import 'package:bookly/Feature/Home/data/repositories/home_repo.dart';
import 'package:bookly/Core/Utils/Entities/book_entities.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/Utils/Errors/failure.dart';

class FetchBooksPicturesUseCase {
  final HomeRepo homeRepo;
  FetchBooksPicturesUseCase(this.homeRepo);
  Future<Either<Failure, List<BookEntities>>> execute() {
    return homeRepo.fetchBooksPictures();
  }
}

class FetchAllBooksUseCase {
  final HomeRepo homeRepo;
  FetchAllBooksUseCase(this.homeRepo);
  Future<Either<Failure, List<BookEntities>>> execute() {
    return homeRepo.fetchAllBooks();
  }
}
