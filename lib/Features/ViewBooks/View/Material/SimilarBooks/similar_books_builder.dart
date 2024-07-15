import 'package:bookly/Core/Utils/Widget/custom_loading.dart';import 'package:bookly/Core/Utils/Widget/custom_massage.dart';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import '../../../../../Core/Routes/next_screen.dart';import '../../../../../Core/Routes/route_app.dart';import '../../../../../Core/Utils/Widget/custom_books_image.dart';import '../../../../../Core/Utils/text_style.dart';import '../../../ViewModel/SimilarBooksCubit/similar_books_cubit.dart';import '../../../ViewModel/SimilarBooksCubit/similar_books_state.dart';const String _title = "Similar Books";class SimilarBooks extends StatelessWidget {  const SimilarBooks({super.key});  @override  Widget build(BuildContext context) {    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(      builder: (context, state) {        if (state is SimilarBooksSuccess) {          return Expanded(            child: SingleChildScrollView(              child: Column(                crossAxisAlignment: CrossAxisAlignment.start,                children: [                  Padding(                    padding: const EdgeInsets.only(top: 20, left: 35,bottom: 20),                    child: Text(                      _title,                      style: Styles.textStyle18                          .copyWith(fontWeight: FontWeight.w700),                    ),                  ),                  SizedBox(                    height: MediaQuery.of(context).size.height * .15,                    child: ListView.separated(                      scrollDirection: Axis.horizontal,                      itemBuilder: (context, index) =>  InkWell(                          onTap: () => pushNext(context, AppRoutes.viewBooksRoute,arguments: state.books[index]),                          child: CustomBooksImage(                          imageUrl: state.books[index].volumeInfo!.imageLinks!                              .thumbnail!)),                      itemCount: state.books.length,                      separatorBuilder: (context, index) => const SizedBox(width: 10,),                    ),                  ),                ],              ),            ),          );        } else if (state is SimilarBooksFailure) {          return CustomMassage(massage: state.error);        } else {          return const CustomLoading();        }      },    );  }}