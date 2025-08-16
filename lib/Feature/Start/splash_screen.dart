import 'package:flutter/material.dart';

import '../../Config/Routes/next_screen.dart';
import '../../Config/Routes/route_app.dart';
import '../../Config/assets.dart';

class SplashViewScreen extends StatefulWidget {
  const SplashViewScreen({super.key});

  @override
  State<SplashViewScreen> createState() => _SplashViewScreenState();
}

class _SplashViewScreenState extends State<SplashViewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInBack,
      reverseCurve: Curves.easeOut,
    );
    Future.delayed(const Duration(seconds: 9), () {
      if (mounted) return pushReplacement(context, AppRoutes.homeRoute);
    });
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
      animation: _animation,
      builder: (context, child) => AnimatedScale(
        scale: _animation.value,
        duration: const Duration(seconds: 3),
        child: Center(child: AppConstant.appLogo()),
      ),
    );
  }
}
