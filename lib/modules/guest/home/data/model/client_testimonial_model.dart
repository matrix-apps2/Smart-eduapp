class ClientTestimonialModel{
  int? id;
  String? name;
  DateTime? date;
  double? rate;
  String? comment;
  String? image;

  ClientTestimonialModel({
    this.id,
    this.name,
    this.date,
    this.rate,
    this.comment,
    this.image,
  });

  ClientTestimonialModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    rate = json['rate'];
    comment = json['comment'];
    image = json['image'];
  }
}
