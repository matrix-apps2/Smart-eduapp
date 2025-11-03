class CountryModel {
  int? id;
  String? name;
  String? code;
  String? logo;
  String? phoneCode;

  CountryModel({
    this.id,
    this.name,
    this.code,
    this.logo,
    this.phoneCode,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'] ?? "N/A";
    logo = json['logo'] ?? "N/A";
    phoneCode = json['phoneCode'] ?? "N/A";
  }
}
