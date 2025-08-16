import 'package:bookly/Core/network/app_end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../Feature/Basket/data/Models/payment_model.dart';
import '../../Feature/Basket/data/Models/ephemeral_keys_model.dart';
import '../../Feature/Basket/data/Models/init_payment_sheet_input_model.dart';
import '../../Feature/Basket/domain/Entities/payment_input_entities.dart';
import 'api_keys.dart';
import 'dio.dart';

class StripService {
  //1- Create Payment Intent
  Future<PaymentModel> _createPaymentIntent(
    PaymentInputEntities paymentInputEntities,
  ) async {
    var response = await DioHelper.postData(
      options: Options(contentType: Headers.formUrlEncodedContentType),
      path: AppEndPoint.stripe,
      data: paymentInputEntities.toJson(),
      token: ApiKeys.secretKey,
    );
    var paymentModel = PaymentModel.fromJson(response.data);
    return paymentModel;
  }

  Future<EphemeralKeysModel> _createEphemeralKeys({
    required String customerID,
  }) async {
    var response = await DioHelper.postData(
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2024-06-20',
        },
      ),
      path: AppEndPoint.ephemeral,
      data: {'customer': customerID},
    );
    var ephemeralKey = EphemeralKeysModel.fromJson(response.data);
    return ephemeralKey;
  }

  //2- init Payment Sheet
  Future _initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    const appearance = PaymentSheetAppearance(
      colors: PaymentSheetAppearanceColors(
        primary: Color.fromARGB(255, 36, 36, 47),
        componentBackground: Color.fromARGB(255, 248, 248, 248),
        background: Color.fromARGB(255, 46, 96, 162),
        componentBorder: Colors.transparent,
        componentDivider: Colors.black,
        placeholderText: Color.fromARGB(255, 115, 117, 123),
        error: Colors.red,
      ),
      shapes: PaymentSheetShape(borderRadius: 12.0, borderWidth: 0),
    );
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: "Felopater Sameh",
        appearance: appearance,
      ),
    );
  }

  // 3- display Present Sheet
  Future _displayPresentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  //*** using
  Future makePaymentIntent({
    required PaymentInputEntities paymentInputEntities,
  }) async {
    var paymentInput = await _createPaymentIntent(paymentInputEntities);
    var ephemeralKeys = await _createEphemeralKeys(
      customerID: paymentInputEntities.idCustomer,
    );
    var initPaymentSheet = InitPaymentSheetInputModel(
      ephemeralKeySecret: ephemeralKeys.secret!,
      clientSecret: paymentInput.clientSecret!,
      customerId: paymentInputEntities.idCustomer,
    );
    await _initPaymentSheet(initPaymentSheetInputModel: initPaymentSheet);

    await _displayPresentSheet();
  }
}
