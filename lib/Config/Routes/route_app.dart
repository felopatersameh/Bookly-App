import 'package:bookly/Core/Utils/service_locator.dart';
import 'package:bookly/Feature/Books/domain/use_cases/similar_books_use_case.dart';
import 'package:bookly/Feature/Home/presentation/pages/home_screen.dart';
import 'package:bookly/Feature/Books/presentation/manager/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Feature/Research/presentation/pages/search_screen.dart';
import '../../Feature/Start/splash_screen.dart';
import '../../Feature/Books/presentation/pages/view_book.dart';
import '../../Core/Models/book_model.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String homeRoute = 'Home/';
  static const String viewBooksRoute = 'ViewBooks/';
  static const String searchRoute = 'Search/';
}

class GeneratorRoutes {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case (AppRoutes.initialRoute):
        return MaterialPageRoute(builder: (_) => const SplashViewScreen());
      case (AppRoutes.homeRoute):
        return MaterialPageRoute(builder: (_) => const HomePage());
      case (AppRoutes.searchRoute):
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case (AppRoutes.viewBooksRoute):
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (context) =>
                SimilarBooksCubit(getIt<SimilarBooksUseCase>()),
            child: ViewInformationBook(
              item: setting.arguments as BookModel,
            ),
          );
        });
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold()); // TODO Create default
    }
  }
}
