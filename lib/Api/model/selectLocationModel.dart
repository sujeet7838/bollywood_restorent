class SelectLocationModel {
  final int id;
  final String name;
  final String active;

  SelectLocationModel({
    required this.id,
    required this.name,
    required this.active,
  });

  factory SelectLocationModel.fromJson(Map<String, dynamic> json) {
    return SelectLocationModel(
      id: json['id'],
      name: json['name'],
      active: json['active'],
    );
  }
}
