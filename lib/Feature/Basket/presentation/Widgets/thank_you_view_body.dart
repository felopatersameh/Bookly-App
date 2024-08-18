
import 'package:bookly/Feature/Basket/presentation/Widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/Resources/colors.dart';
import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';
class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const ThankYouCard(),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * .2 + 20,
              left: 20 + 8,
              right: 20 + 8,
              child: const CustomDashedLine(),
            ),
            Positioned(
                left: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child:  const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                )),
            Positioned(
                right: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child:  const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                )),
            const Positioned(
              top: -50,
              left: 0,
              right: 0,
              child: CustomCheckIcon(),
            ),
          ],
        ),
      ),
    );
  }
}
