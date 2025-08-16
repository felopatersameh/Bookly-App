import 'package:bookly/Feature/Research/domain/use_cases/search_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Utils/Entities/book_entities.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  final SearchUseCase searchUseCase;
  String category = "";
  Future<void> search() async {
    emit(SearchLoading());
    await searchUseCase
        .execute(category: category)
        .then(
          (value) => value.fold(
            (failure) => emit(SearchFailure(error: failure.errMessage)),
            (books) => emit(SearchSuccess(books: books)),
          ),
        );
  }
}
