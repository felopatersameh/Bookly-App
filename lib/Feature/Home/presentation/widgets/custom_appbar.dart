import 'package:bookly/Config/Routes/next_screen.dart';
import 'package:bookly/Config/Routes/route_app.dart';
import 'package:flutter/material.dart';
import '../../../../Config/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppConstant.appLogo(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => pushNext(context, AppRoutes.searchRoute),
          ),
        ],
      ),
    );
  }
}
