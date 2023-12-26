class CategoryListModel {
  String? id;
  String? name;
  String? active;

  CategoryListModel({this.id, this.name, this.active});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['active'] = active;
    return data;
  }
}
