import 'package:flutter/material.dart';
import 'news_books_builder.dart';

class NewsBooksView extends StatefulWidget {
  const NewsBooksView({super.key});
  @override
  State<NewsBooksView> createState() => _NewsBooksViewState();
}

class _NewsBooksViewState extends State<NewsBooksView>
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
      begin: const Offset(0, 4),
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
        child: const NewsBooksBuilder(),
      ),
    );
  }
}
