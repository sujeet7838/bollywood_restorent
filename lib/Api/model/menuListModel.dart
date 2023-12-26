class MenuListModel {
  String? id;
  String? categoryId;
  String? storeId;
  String? name;
  String? price;
  String? description;
  String? image;
  String? active;

  MenuListModel(
      {this.id,
      this.categoryId,
      this.storeId,
      this.name,
      this.price,
      this.description,
      this.image,
      this.active});

  MenuListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    storeId = json['store_id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['store_id'] = this.storeId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['active'] = this.active;
    return data;
  }
}
