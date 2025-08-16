class SaleInfo {
  SaleInfo.fromJson(dynamic json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    listPrice = json["listPrice"] != null
        ? ListPrice.fromJson(json["listPrice"])
        : null;
  }
  String? country;
  String? saleability;
  bool? isEbook;
  ListPrice? listPrice;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['saleability'] = saleability;
    map['isEbook'] = isEbook;
    if (listPrice != null) {
      map['listPrice'] = listPrice?.toJson();
    }
    return map;
  }
}

class ListPrice {
  num? amount;
  String? currencyCode;
  ListPrice.fromJson(dynamic json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['currencyCode'] = currencyCode;
    return map;
  }
}
