class AssociatedObjects {
  AssociatedObjects({this.id, this.type});
  AssociatedObjects.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
  }
  String? id;
  String? type;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    return map;
  }
}
