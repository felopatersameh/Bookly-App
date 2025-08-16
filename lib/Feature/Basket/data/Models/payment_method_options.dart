import 'card.dart';
import 'link.dart';

class PaymentMethodOptions {
  PaymentMethodOptions({this.card, this.link});

  PaymentMethodOptions.fromJson(dynamic json) {
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
    link = json['link'] != null ? LinkModel.fromJson(json['link']) : null;
  }
  Card? card;
  LinkModel? link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (card != null) {
      map['card'] = card?.toJson();
    }
    if (link != null) {
      map['link'] = link?.toJson();
    }
    return map;
  }
}
