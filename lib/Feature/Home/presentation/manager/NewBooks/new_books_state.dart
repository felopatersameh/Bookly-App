part of 'new_books_cubit.dart';

abstract class NewBooksState {}

final class NewBooksInitial extends NewBooksState {}

final class GetBooksPictureLoading extends NewBooksState {}

final class GetBooksPictureSuccess extends NewBooksState {
  final List<BookEntities> books;
  GetBooksPictureSuccess({required this.books});
}

final class GetBooksPictureFailure extends NewBooksState {
  final String error;
  GetBooksPictureFailure({required this.error});
}
