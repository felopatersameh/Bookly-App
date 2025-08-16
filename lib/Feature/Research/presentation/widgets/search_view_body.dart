import '../../../../Core/Utils/Widget/custom_loading.dart';
import '../../../../Core/Utils/Widget/custom_massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Utils/Widget/View_Books/build_items_books_vertical.dart';
import '../../../../Core/Utils/Resources/text_style.dart';
import '../manager/search_cubit.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});
  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSearchTextField(),
                  const SizedBox(height: 16),
                  const Text('Search Result', style: Styles.textStyle18),
                  const SizedBox(height: 16),
                  if (state is SearchSuccess)
                    Expanded(child: ListViewBooksVertical(items: state.books)),
                  if (state is SearchFailure)
                    Expanded(child: CustomMassage(massage: state.error)),
                  if (state is SearchLoading)
                    const Expanded(child: CustomLoading()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
