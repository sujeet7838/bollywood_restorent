class AboutModel {
  String? about;

  AboutModel({this.about});

  AboutModel.fromJson(Map<String, dynamic> json) {
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['about'] = this.about;
    return data;
  }
}
