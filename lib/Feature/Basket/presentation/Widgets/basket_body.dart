import 'package:bookly/Config/Routes/next_screen.dart';
import 'package:bookly/Config/Routes/route_app.dart';
import 'package:bookly/Core/Utils/Resources/colors.dart';
import 'package:bookly/Core/Utils/Resources/text_style.dart';
import 'package:bookly/Core/Utils/Widget/custom_massage.dart';
import 'package:bookly/Core/network/api_keys.dart';
import 'package:bookly/Feature/Basket/presentation/Manager/strip_payment_cubit.dart';
import 'package:bookly/Feature/Home/presentation/manager/MainCubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Utils/Widget/View_Books/build_items_books_vertical.dart';
import '../../domain/Entities/payment_input_entities.dart';

class BasketBody extends StatelessWidget {
  const BasketBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripPaymentCubit, StripPaymentState>(
      listener: (context, state) {
        if (state is Success) {
          const CustomMassage(massage: "Success");
          pushNext(context, AppRoutes.resultRoute);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListViewBooksVertical(
                      deleteIcon: true,
                      items: MainCubit.get(context).listOfBookMaps,
                    ),
                  ),
                ),
                const _BottomPay(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BottomPay extends StatelessWidget {
  const _BottomPay();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            color: AppColors.primaryColor,
            height: MediaQuery.sizeOf(context).height * .09,
            child: Column(
              children: [
                const Divider(height: 2),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Total"),
                          Text('${MainCubit.get(context).totalPrice} USD'),
                        ],
                      ),
                    ),
                    _button(context),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  OutlinedButton _button(BuildContext context) => OutlinedButton(
    onPressed: () async {
      PaymentInputEntities paymentInputEntities = PaymentInputEntities(
        "${MainCubit.get(context).totalPrice * 100}",
        'USD',
        ApiKeys.idCostumer,
      );
      await StripPaymentCubit.get(
        context,
      ).makeStripPayment(paymentInputEntities: paymentInputEntities);
    },
    child: const Text('Pay', style: Styles.textStyle20),
  );
}
