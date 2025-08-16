import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'novels_book_builder.dart';

class ProductView extends StatefulWidget {
  final double? aspectRatio;
  const ProductView({super.key, this.aspectRatio});
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
      begin: const Offset(4, 0),
      end: const Offset(0, 0),
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => SlideTransition(
        position: _animation,
        child: NovelsBookBuilder(aspectRatio: widget.aspectRatio),
      ),
    );
  }
}
