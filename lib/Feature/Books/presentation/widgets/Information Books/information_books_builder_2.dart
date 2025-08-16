import 'package:bookly/Core/Utils/Widget/custom_books_image.dart';
import 'package:bookly/Core/Utils/Resources/methods.dart';
import 'package:bookly/Core/Utils/Entities/book_entities.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/Utils/Resources/icons.dart';
import '../../../../../Core/Utils/Resources/text_style.dart';
import 'button_builder_3.dart';

class DetailsTheBook extends StatefulWidget {
  const DetailsTheBook({super.key, required this.item});
  final BookEntities item;
  @override
  State<DetailsTheBook> createState() => _DetailsTheBookState();
}

class _DetailsTheBookState extends State<DetailsTheBook>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0,
      end: 20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, right: 100, left: 100),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .30,
                    child: AspectRatio(
                      aspectRatio: 162 / 243,
                      child: Transform.translate(
                        offset: Offset(0, _animation.value),
                        child: CustomBooksImage(
                          imageUrl: widget.item.imageLinks ?? "",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: Text(
                      widget.item.title!,
                      style: Styles.textStyle30,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: Text(
                      printName(widget.item.authors!),
                      style: Styles.textStyle18.copyWith(
                        color: const Color(0xffc4c1c1),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcons.starOfRating,
                        Text(
                          widget.item.averageRating!.toString(),
                          style: Styles.textStyle14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "(${widget.item.ratingsCount})",
                          style: Styles.textStyle14.copyWith(
                            color: const Color(0xff707070),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        ButtonBuilder(item: widget.item),
      ],
    );
  }
}
