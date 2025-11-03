class PackagesModel {
  int? id;
  String? name;
  String? description;
  String? price;
  String? duration;
  List<String> features = [];

  PackagesModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.duration,
    required this.features,
  });

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        duration: json["duration"],
        features: List<String>.from(json["features"].map((x) => x)),
      );
}
