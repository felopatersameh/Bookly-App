import 'package:bookly/Features/Home/Data/Repos/home_repo_imple.dart';
import 'package:bookly/Features/Home/ViewModel/FeatureCubit/featured_cubit.dart';
import 'package:bookly/Features/Home/ViewModel/NewsBooksCubit/news_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Core/bloc_observer.dart';
import 'Core/network/dio.dart';
import 'Features/Splash/View/splash_screen.dart';

// * mvvm
// Core=>

// Feature=>screen1=>
// (
// 1-DataLayer =>models and //repo
// 2-,view => Ui
// 3-,ViewModel(Manger)=> stateManagement
// )
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                FeaturedCubit(HomeRepoImpl())..fetchNewsBooksBooks()),
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
        home: const SplashViewScreen(),
      ),
    );
  }
}
