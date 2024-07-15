import 'package:bookly/Core/Routes/next_screen.dart';import 'package:bookly/Core/Routes/route_app.dart';import 'package:bookly/Core/Utils/Widget/custom_books_image.dart';import 'package:bookly/Core/Utils/constant.dart';import 'package:bookly/Core/Utils/extensions.dart';import 'package:bookly/Core/Utils/text_style.dart';import 'package:bookly/Features/Home/ViewModel/NewsBooksCubit/news_books_cubit.dart';import 'package:bookly/Features/Home/ViewModel/NewsBooksCubit/news_books_state.dart';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';const String _title = "News Books";class NewsBooksBuilder extends StatelessWidget {  const NewsBooksBuilder({super.key});  @override  Widget build(BuildContext context) {    return BlocBuilder<NewsBooksCubit, NewsBooksState>(      builder: (context, state) {        if (state is NewsBooksSuccess) {          return Padding(            padding: const EdgeInsets.only(top: 20, right: 30, left: 40),            child: Column(              crossAxisAlignment: CrossAxisAlignment.start,              children: [                Text(                  _title,                  style:                      Styles.textStyle18.copyWith(fontWeight: FontWeight.w900),                ),                const SizedBox(                  height: 20,                ),                ListView.separated(                    physics: const ClampingScrollPhysics(),                    shrinkWrap: true,                    scrollDirection: Axis.vertical,                    itemBuilder: (context, index) {                      var item = state.books[index];                      return Row(                        children: [                          SizedBox(                            width: MediaQuery.of(context).size.width * .25,                            child: CustomBooksImage(                                imageUrl:                                    item.volumeInfo!.imageLinks!.thumbnail!),                          ),                          Expanded(                            child: Padding(                              padding:                                  const EdgeInsets.only(left: 20, right: 20),                              child: Column(                                crossAxisAlignment: CrossAxisAlignment.start,                                children: [                                  InkWell(                                      onTap: () => pushNext(context, AppRoutes.viewBooksRoute,arguments: item),                                      child: Text(                                        item.volumeInfo!.title.toString(),                                        style: Styles.textStyle20,                                        maxLines: 2,                                      )),                                  Text(                                    printName(item.volumeInfo!.authors!),                                    style: Styles.textStyle14.copyWith(                                        color: const Color(0xffc4c1c1)),                                  ),                                  const SizedBox(                                    height: 10,                                  ),                                  Row(                                    mainAxisAlignment:                                        MainAxisAlignment.spaceBetween,                                    children: [                                      Text(                                        isFree(item.saleInfo!),                                        style: Styles.textStyle20.copyWith(                                            fontWeight: FontWeight.w700,                                            fontSize: 15),                                      ),                                      Row(                                        children: [                                          AppIcons.starOfRating,                                          Text(                                            item.volumeInfo!.averageRating!                                                .toDouble()                                                .toString()                                                .toString(),                                            style: Styles.textStyle14                                                .copyWith(color: Colors.white),                                          ),                                          const SizedBox(                                            width: 5,                                          ),                                          Text(                                            '(${item.volumeInfo!.ratingsCount})',                                            style: Styles.textStyle14.copyWith(                                                color: const Color(0xff707070)),                                          ),                                        ],                                      )                                    ],                                  )                                ],                              ),                            ),                          )                        ],                      );                    },                    separatorBuilder: (context, index) => const SizedBox(                          height: 7,                        ),                    itemCount: state.books.length)              ],            ),          );        }        return Container();      },    );  }}