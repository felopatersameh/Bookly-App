import 'package:bookly/Core/Routes/route_app.dart';
import 'package:bookly/Features/Home/Data/Repos/home_repo_imple.dart';
import 'package:bookly/Features/Home/ViewModel/NewsBooksCubit/news_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Core/bloc_observer.dart';
import 'Core/network/dio.dart';
import 'Features/Home/ViewModel/NovelsBooksCubit/novels_book_cubit.dart';

// * mvvm
// Core=>

// Feature=>screen1=>
// (
// 1-DataLayer =>models and //repo
// 2-,view => Ui
// 3-,ViewModel(Manger)=> stateManagement
// )



// todo => [1-searchScreen] , [2-layoutScreen Contain the (Card And homeScreen)] , [3-Edit in SimilarBooks]  , [4-Edit Logo App] , [5-Change Name App to Bookly]

//Done =>





void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
            create: (context) =>
                NovelsBooksCubit(HomeRepoImpl())..fetchNewsBooksBooks()),
        BlocProvider(
            create: (context) =>
                NewsBooksCubit(HomeRepoImpl())..fetchNewsBooksBooks()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xff100B20),
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        // home: const SplashViewScreen(),
        onGenerateRoute: GeneratorRoutes.getRoute,
        initialRoute: AppRoutes.initialRoute,
      ),
    );
  }
}
