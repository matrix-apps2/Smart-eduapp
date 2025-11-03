import 'dart:ui';

class CoreServiceModel {
  int? id;
  String? title;
  String? image;
  Color? color;

  CoreServiceModel({
    this.id,
    this.title,
    this.image,
    this.color,
  });

  CoreServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    color = json['color'];
  }
}
