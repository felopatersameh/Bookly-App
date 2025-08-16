import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Config/Routes/route_app.dart';
import 'Core/Utils/Resources/colors.dart';
import 'Core/network/api_keys.dart';
import 'Core/network/dio.dart';
import 'Core/network/service_locator.dart';
import 'Feature/Books/domain/use_cases/similar_books_use_case.dart';
import 'Feature/Books/presentation/manager/similar_books_cubit.dart';
import 'Feature/Home/domain/use_cases/home_use_cases.dart';
import 'Feature/Home/presentation/manager/Books/books_cubit.dart';
import 'Feature/Home/presentation/manager/MainCubit/main_cubit.dart';
import 'Feature/Home/presentation/manager/NewBooks/new_books_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  setupService();
  // Bloc.observer = MyBlocObserver();
  DioHelper.init();
  Stripe.publishableKey = ApiKeys.publishKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BooksCubit(getIt<FetchAllBooksUseCase>())..fetchAllBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewBooksCubit(getIt<FetchBooksPicturesUseCase>())
                ..fetchBooksPictures(),
        ),
        BlocProvider(
          create: (context) => SimilarBooksCubit(getIt<SimilarBooksUseCase>()),
        ),
        BlocProvider(create: (context) => getIt<MainCubit>()),
      ],
      child: MaterialApp(
        title: "Bookly",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.primaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        onGenerateRoute: GeneratorRoutes.getRoute,
        initialRoute: AppRoutes.initialRoute,
      ),
    );
  }
}
