import '../Entities/book_entities.dart';
import 'access_info.dart';
import 'sale_info.dart';
import 'volume_info.dart';

class BookModel extends BookEntities {
  String? kind;
  late String id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  @override
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  BookModel({
    required this.id,
    this.kind,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  }) : super(
         id,
         volumeInfo?.imageLinks?.thumbnail,
         volumeInfo?.title,
         volumeInfo?.description,
         volumeInfo?.authors,
         volumeInfo?.averageRating,
         volumeInfo?.ratingsCount,
         volumeInfo?.language,
         volumeInfo?.previewLink,
         volumeInfo?.subtitle,
         saleInfo,
         volumeInfo?.categories,
         accessInfo?.pdf,
       );
  factory BookModel.fromJson(dynamic json) {
    return BookModel(
      kind: json['kind'],
      id: json['id'],
      etag: json['etag'],
      selfLink: json['selfLink'],
      volumeInfo: json['volumeInfo'] != null
          ? VolumeInfo.fromJson(json['volumeInfo'])
          : null,
      saleInfo: json['saleInfo'] != null
          ? SaleInfo.fromJson(json['saleInfo'])
          : null,
      accessInfo: json['accessInfo'] != null
          ? AccessInfo.fromJson(json['accessInfo'])
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    if (volumeInfo != null) {
      map['volumeInfo'] = volumeInfo?.toJson();
    }
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    return map;
  }
}
