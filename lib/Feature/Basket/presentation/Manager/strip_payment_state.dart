part of 'strip_payment_cubit.dart';

@immutable
sealed class StripPaymentState {}

final class StripPaymentInitial extends StripPaymentState {}

final class Loading extends StripPaymentState {}

final class Success extends StripPaymentState {
  final bool item;
  Success({required this.item});
}

final class Failure extends StripPaymentState {
  final String error;
  Failure({required this.error});
}
