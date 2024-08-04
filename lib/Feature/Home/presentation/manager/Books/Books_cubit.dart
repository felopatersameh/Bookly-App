import 'package:bookly/Feature/Home/domain/entities/book_entities.dart';import 'package:bookly/Feature/Home/domain/use_cases/home_use_cases.dart';import 'package:flutter_bloc/flutter_bloc.dart';part 'Books_state.dart';class BooksCubit extends Cubit<BooksState> {  BooksCubit(    this.fetchAllBooksUseCase,  ) : super(HomeInitial());  final FetchAllBooksUseCase fetchAllBooksUseCase;  static BooksCubit get(context) => BlocProvider.of(context);  Future<void> fetchAllBooks() async {    emit(GetAllBooksLoading());    await fetchAllBooksUseCase.execute().then((value) {      value.fold(          (failure) => emit(GetAllBooksFailure(error: failure.errMessage)),          (books) => emit(GetAllBooksSuccess(books: books)));    });  }}