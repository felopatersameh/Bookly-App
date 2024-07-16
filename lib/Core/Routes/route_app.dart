import 'package:bookly/Features/Home/Data/Repos/home_repo_imple.dart';
import 'package:bookly/Features/Home/View/home_screen.dart';
import 'package:bookly/Features/ViewBooks/ViewModel/SimilarBooksCubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Features/Splash/View/splash_screen.dart';
import '../../Features/ViewBooks/View/view_book.dart';
import '../Models/book_model.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String homeRoute = 'Home/';
  static const String viewBooksRoute = 'ViewBooks/';
}

class GeneratorRoutes {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case (AppRoutes.initialRoute):
        return MaterialPageRoute(builder: (_) => const SplashViewScreen());
      case (AppRoutes.homeRoute):
        return MaterialPageRoute(builder: (_) => const HomePage());
      case (AppRoutes.viewBooksRoute):
        return MaterialPageRoute(builder: (_) {
         return  BlocProvider(
            create: (context) => SimilarBooksCubit(HomeRepoImpl()),
            child:  ViewInformationBook(item:setting.arguments as BookModel,),
          );
        });
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold()); // TODO Create default
    }
  }
}
