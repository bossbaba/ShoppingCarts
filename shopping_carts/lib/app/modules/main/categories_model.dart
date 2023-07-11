class Categories {
  String? name;
  String? id;
  String? icon;
  String? descriptions;
  String? count;

  Categories({this.name, this.id, this.icon, this.descriptions, this.count});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    icon = json['icon'];
    descriptions = json['descriptions'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['icon'] = icon;
    data['descriptions'] = descriptions;
    data['count'] = count;
    return data;
  }
}
