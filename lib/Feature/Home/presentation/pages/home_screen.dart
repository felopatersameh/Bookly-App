import 'package:bookly/Core/Utils/Widget/custom_loading.dart';
import 'package:bookly/Core/Utils/Widget/custom_massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/MainCubit/main_cubit.dart';
import '../widgets/NewsBooks/news_books_view_animation.dart';
import '../widgets/NovelsBooks/novels_book_builder.dart';
import '../widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        if (state is ConnectivityLoading) {
          return const Scaffold(body: CustomLoading());
        } else if (state is ConnectivityDisconnected) {
          return _connectivityDisconnected();
        } else {
          return _connectivityConnected();
        }
      },
    );
  }

  Scaffold _connectivityDisconnected() {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLoading(),
            CustomMassage(massage: "No internet connection"),
          ],
        ),
      ),
    );
  }

  Scaffold _connectivityConnected() {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: false,
          child: Column(
            children: [CustomAppBar(), NovelsBookBuilder(), NewsBooksView()],
          ),
        ),
      ),
    );
  }
}
