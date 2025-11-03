class RateModel {
  int? id;
  String? name;
  String? body;
  String? img;
  double? rating;
  DateTime? createdAt;

  RateModel({
    this.id,
    this.name,
    this.body,
    this.img,
    this.rating,
    this.createdAt,
  });

  RateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    body = json['body'];
    img = json['image'];
    rating = json['rating'];
    createdAt = DateTime.parse(json['created_at']);
  }
}
