import 'package:bookly/Feature/Books/domain/use_cases/similar_books_use_case.dart';
import 'package:bookly/Feature/Books/presentation/manager/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksUseCase) : super(SimilarBooksInitial());
  static SimilarBooksCubit get(context) => BlocProvider.of(context);
  final SimilarBooksUseCase similarBooksUseCase;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    await similarBooksUseCase
        .execute(category: category)
        .then(
          (value) => value.fold(
            (failure) => emit(SimilarBooksFailure(error: failure.errMessage)),
            (books) => emit(SimilarBooksSuccess(books: books)),
          ),
        );
  }
}
