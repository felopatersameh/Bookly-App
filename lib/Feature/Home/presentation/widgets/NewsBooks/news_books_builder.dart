import 'package:bookly/Core/Utils/Widget/custom_massage.dart';
import 'package:bookly/Core/Utils/Resources/text_style.dart';
import 'package:bookly/Feature/Home/presentation/manager/Books/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Utils/Widget/View_Books/build_items_books_vertical.dart';

const String _title = "News Books";

class NewsBooksBuilder extends StatelessWidget {
  const NewsBooksBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is GetAllBooksSuccess) {
          return _body(state);
        } else if (state is GetAllBooksFailure) {
          return CustomMassage(massage: state.error);
        } else {
          return Container(); // return const CustomLoading();
        }
      },
    );
  }

  Padding _body(GetAllBooksSuccess state) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 30, left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 20),
          ListViewBooksVertical(items: state.books),
        ],
      ),
    );
  }
}
