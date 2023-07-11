class Categories {
  String? name;
  String? id;
  String? icon;
  String? descriptions;

  Categories({this.name, this.id, this.icon, this.descriptions});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    icon = json['icon'];
    descriptions = json['descriptions'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['icon'] = icon;
    data['descriptions'] = descriptions;
    return data;
  }
}
