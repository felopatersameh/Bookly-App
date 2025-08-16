import 'package:bookly/Feature/Books/presentation/manager/similar_books_cubit.dart';
import 'package:bookly/Core/Utils/Entities/book_entities.dart';
import 'package:flutter/material.dart';
import '../widgets/Information Books/custom_book_details_appbar_1.dart';
import '../widgets/Information Books/information_books_builder_2.dart';
import '../widgets/SimilarBooks/similar_books_builder.dart';

class ViewInformationBook extends StatefulWidget {
  const ViewInformationBook({super.key, required this.item});
  final BookEntities item;
  @override
  State<ViewInformationBook> createState() => _ViewInformationBookState();
}

class _ViewInformationBookState extends State<ViewInformationBook> {
  @override
  void initState() {
    final String category =
        (widget.item.category != null && widget.item.category!.isNotEmpty)
        ? widget.item.category![0]
        : ""; // print('22- category : $category ');
    SimilarBooksCubit.get(context).fetchSimilarBooks(category: category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomBookDetailsAppbar(),
            DetailsTheBook(item: widget.item),
            SimilarBooks(id: widget.item.id),
          ],
        ),
      ),
    );
  }
}
