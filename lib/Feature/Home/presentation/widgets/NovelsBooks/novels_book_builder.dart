import 'package:bookly/Core/Utils/Widget/custom_loading.dart';
import 'package:bookly/Core/Utils/Widget/custom_massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Utils/Widget/View_Books/build_items_books_horizontal.dart';
import '../../manager/NewBooks/new_books_cubit.dart';

class NovelsBookBuilder extends StatelessWidget {
  final double? aspectRatio;
  const NovelsBookBuilder({super.key, this.aspectRatio});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBooksCubit, NewBooksState>(
      builder: (context, state) {
        if (state is GetBooksPictureSuccess) {
          return _body(context, state);
        } else if (state is GetBooksPictureFailure) {
          return CustomMassage(massage: state.error);
        } else {
          return const CustomLoading();
        }
      },
    );
  }

  SizedBox _body(BuildContext context, GetBooksPictureSuccess state) =>
      SizedBox(
        height: aspectRatio ?? MediaQuery.of(context).size.height * .27,
        child: BuildItemsBooksHorizontal(items: state.books),
      );
}
