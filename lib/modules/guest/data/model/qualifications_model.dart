class QualificationsModel{
  int? id;
  String? title;
  String? subTitle;
  String? image;

  QualificationsModel({
    this.id,
    this.title,
    this.subTitle,
    this.image,
  });

  QualificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    image = json['image'];
  }
}
