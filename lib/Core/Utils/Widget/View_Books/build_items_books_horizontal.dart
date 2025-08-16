import 'package:bookly/Core/Utils/Entities/book_entities.dart';
import 'package:flutter/material.dart';
import '../../../../Config/Routes/next_screen.dart';
import '../../../../Config/Routes/route_app.dart';
import '../custom_books_image.dart';

class BuildItemsBooksHorizontal extends StatelessWidget {
  final String? id;
  final List<BookEntities> items;
  const BuildItemsBooksHorizontal({super.key, required this.items, this.id});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, top: 0, bottom: 40),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final book = items[index];
          if (book.imageLinks == null || id == book.id) {
            return Container();
          }
          return InkWell(
            onTap: () =>
                pushNext(context, AppRoutes.viewBooksRoute, arguments: book),
            child: CustomBooksImage(imageUrl: book.imageLinks!),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: items.length,
      ),
    );
  }
}
