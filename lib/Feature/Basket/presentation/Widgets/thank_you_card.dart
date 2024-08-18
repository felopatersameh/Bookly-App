import 'package:bookly/Feature/Basket/presentation/Widgets/payment_info_item.dart';
import 'package:bookly/Feature/Basket/presentation/Widgets/total_price_widget.dart';
import 'package:bookly/Feature/Home/presentation/manager/MainCubit/main_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/Resources/methods.dart';
import '../../../../Core/Utils/Resources/text_style.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFF2E333D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.textStyle25,
            ),
            const Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 42,
            ),
            PaymentItemInfo(
              title: 'Date',
              value: formatDate(),
            ),
            const SizedBox(
              height: 20,
            ),
            PaymentItemInfo(
              title: 'Time',
              value: formatTime(),
            ),
            const Divider(
              height: 60,
              thickness: 2,
            ),
            TotalPrice(
                title: 'Total',
                value: ' ${MainCubit.get(context).totalPrice} USD'),
            const SizedBox(
              height: 30,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.qr_code_2_outlined,
                  size: 80,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.textStyle20
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
