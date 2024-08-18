import 'package:bookly/Core/Utils/Entities/book_entities.dart';
import 'package:bookly/Core/network/service_locator.dart';
import 'package:bookly/Feature/Basket/presentation/Manager/strip_payment_cubit.dart';
import 'package:bookly/Feature/Basket/presentation/pages/result_screen%20.dart';
import 'package:bookly/Feature/Home/presentation/pages/home_screen.dart';
import 'package:bookly/Feature/Research/domain/use_cases/search_use_case.dart';
import 'package:bookly/Feature/Research/presentation/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Feature/Basket/domain/use_cases/payment_use_case.dart';
import '../../Feature/Basket/presentation/pages/basket_screen.dart';
import '../../Feature/Books/presentation/pages/view_book.dart';
import '../../Feature/Research/presentation/pages/search_screen.dart';
import '../../Feature/Start/splash_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String homeRoute = 'Home/';
  static const String viewBooksRoute = 'ViewBooks/';
  static const String searchRoute = 'Search/';
  static const String basketRoute = 'Basket/';
  static const String resultRoute = 'Result/';
}

class GeneratorRoutes {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case (AppRoutes.initialRoute):
        return MaterialPageRoute(builder: (_) => const SplashViewScreen());
      case (AppRoutes.homeRoute):
        return MaterialPageRoute(builder: (_) => const HomePage());
      case (AppRoutes.basketRoute):
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      StripPaymentCubit(getIt<PaymentUseCase>()),
                  child: const BasketScreen(),
                ));
      case (AppRoutes.searchRoute):
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SearchCubit(getIt<SearchUseCase>()),
                  child: const SearchScreen(),
                ));
      case (AppRoutes.viewBooksRoute):
        return MaterialPageRoute(builder: (_) {
          return ViewInformationBook(
            item: setting.arguments as BookEntities,
          );
        });
      case (AppRoutes.resultRoute):
        return MaterialPageRoute(builder: (_) => const ResulScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold()); // TODO Create default
    }
  }
}
