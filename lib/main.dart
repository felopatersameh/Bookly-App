import 'package:bookly/Config/Routes/route_app.dart';
import 'package:bookly/Core/Utils/service_locator.dart';
import 'package:bookly/Feature/Home/presentation/manager/Books/Books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Core/bloc_observer.dart';
import 'Core/network/dio.dart';
import 'Feature/Home/domain/use_cases/home_use_cases.dart';
import 'Feature/Home/presentation/manager/NewBooks/new_books_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupService();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => BooksCubit(
                  getIt<FetchAllBooksUseCase>(),
                )..fetchAllBooks()),
        BlocProvider(
            create: (context) =>
                NewBooksCubit(getIt<FetchBooksPicturesUseCase>())
                  ..fetchBooksPictures()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xff100B20),
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        onGenerateRoute: GeneratorRoutes.getRoute,
        initialRoute: AppRoutes.initialRoute,
      ),
    );
  }
}
