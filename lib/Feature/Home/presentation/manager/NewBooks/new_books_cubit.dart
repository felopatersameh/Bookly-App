import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Utils/Entities/book_entities.dart';
import '../../../domain/use_cases/home_use_cases.dart';
part 'new_books_state.dart';

class NewBooksCubit extends Cubit<NewBooksState> {
  NewBooksCubit(this.fetchBooksPicturesUseCase) : super(NewBooksInitial());
  final FetchBooksPicturesUseCase fetchBooksPicturesUseCase;
  static NewBooksCubit get(context) => BlocProvider.of(context);
  Future<void> fetchBooksPictures() async {
    emit(GetBooksPictureLoading());
    var result = await fetchBooksPicturesUseCase.execute();
    result.fold(
      (failure) {
        emit(GetBooksPictureFailure(error: failure.errMessage));
      },
      (books) {
        emit(GetBooksPictureSuccess(books: books));
      },
    );
  }
}
