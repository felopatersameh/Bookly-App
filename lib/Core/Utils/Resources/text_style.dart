import 'package:flutter/material.dart';

const String kGtSectraFine = "Sectra";

abstract class Styles {
  static const textStyle30 = TextStyle(
    overflow: TextOverflow.ellipsis,
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontFamily: kGtSectraFine,
    letterSpacing: 1.2,
  );
  static const textStyle25 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textStyleBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
