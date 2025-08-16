class PaymentInputEntities {
  final String amount;
  final String currency;
  final String idCustomer;
  PaymentInputEntities(this.amount, this.currency, this.idCustomer);
  toJson() {
    return {'currency': currency, 'amount': amount, "customer": idCustomer};
  }
}
