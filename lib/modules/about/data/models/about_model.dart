class AboutModel {
  String? description;

  AboutModel({this.description});

  AboutModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }
}
