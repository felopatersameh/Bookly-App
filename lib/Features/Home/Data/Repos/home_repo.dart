import 'package:dartz/dartz.dart';import '../../../../Core/Utils/Errors/failure.dart';import '../model/book_model.dart';abstract class HomeRepo {  Future<Either<Failure, List<BookModel>>> fetchNewsBooksNovels();  Future<Either<Failure, List<BookModel>>> fetchNewsBooksOfComputerScience();  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(      {required String category});}