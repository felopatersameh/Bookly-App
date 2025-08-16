import '../Models/pdf.dart';
import '../Models/sale_info.dart';

class BookEntities {
  final String id;
  final String? imageLinks;
  final String? title;
  final String? description;
  final List<String>? authors;
  final num? averageRating;
  final num? ratingsCount;
  final String? language;
  final String? previewLink;
  final String? subtitle;
  final SaleInfo? saleInfo;
  final List<String>? category;
  final Pdf? pdf;
  BookEntities(
    this.id,
    this.imageLinks,
    this.title,
    this.description,
    this.authors,
    this.averageRating,
    this.ratingsCount,
    this.language,
    this.previewLink,
    this.subtitle,
    this.saleInfo,
    this.category,
    this.pdf,
  );
}
