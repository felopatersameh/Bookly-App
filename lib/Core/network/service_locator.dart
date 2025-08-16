// flutter pub add get_it
import 'package:bookly/Feature/Books/data/repositories/similar_books_repo.dart';
import 'package:bookly/Feature/Books/domain/repositories/similar_books_repo_impl.dart';
import 'package:bookly/Feature/Books/domain/use_cases/similar_books_use_case.dart';
import 'package:bookly/Feature/Home/data/repositories/home_repo.dart';
import 'package:bookly/Feature/Home/domain/repositories/home_repo_imple.dart';
import 'package:bookly/Feature/Home/presentation/manager/MainCubit/main_cubit.dart';
import 'package:bookly/Feature/Research/data/repositories/search_repo.dart';
import 'package:bookly/Feature/Research/domain/repositories/search_repo_impl.dart';
import 'package:bookly/Feature/Research/domain/use_cases/search_use_case.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import '../../Feature/Basket/data/repositories/payment_repo.dart';
import '../../Feature/Basket/domain/repositories/payment_repo_impl.dart';
import '../../Feature/Basket/domain/use_cases/payment_use_case.dart';
import '../../Feature/Home/domain/use_cases/home_use_cases.dart';

final GetIt getIt = GetIt.instance;
void setupService() {
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());
  getIt.registerLazySingleton<SimilarBooksRepo>(() => SimilarBooksRepoImpl());
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepoImpl());
  getIt.registerLazySingleton<PaymentRepo>(
    () => PaymentRepoImpl(),
  ); //------------------------------------------------------------------
  getIt.registerLazySingleton<FetchBooksPicturesUseCase>(
    () => FetchBooksPicturesUseCase(getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchAllBooksUseCase>(
    () => FetchAllBooksUseCase(getIt<HomeRepo>()),
  ); ////////////////////////////////////////////////////
  getIt.registerLazySingleton<SimilarBooksUseCase>(
    () => SimilarBooksUseCase(getIt<SimilarBooksRepo>()),
  ); ////////////////////////////////////////////////////
  getIt.registerFactory<MainCubit>(
    () => MainCubit(getIt<Connectivity>()),
  ); ////////////////////////////////////////////////////
  getIt.registerFactory<SearchUseCase>(
    () => SearchUseCase(getIt<SearchRepo>()),
  ); ////////////////////////////////////////////////////
  getIt.registerLazySingleton<PaymentUseCase>(
    () => PaymentUseCase(getIt<PaymentRepo>()),
  );
}
