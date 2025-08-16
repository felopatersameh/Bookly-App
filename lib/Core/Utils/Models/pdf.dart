class Pdf {
  Pdf({this.isAvailable, this.acsTokenLink, this.downloadLink});
  Pdf.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
    acsTokenLink = json['acsTokenLink'];
  }
  bool? isAvailable;
  String? acsTokenLink;
  String? downloadLink;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    map['acsTokenLink'] = acsTokenLink;
    map['downloadLink'] = downloadLink;
    return map;
  }
}
