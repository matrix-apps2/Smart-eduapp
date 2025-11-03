//  "id": 16,
//         "name": "Demo User",
//         "email": "developer@gmail.com",
//         "phone": "1234567871",
//         "phone_code": "201",
//         "phone_country": "eg",
//         "image": "https://dev02.matrix-clouds.com/oun/public/storage/users/default.jpg",
//         "is_verified": false,
//         "otp": "2077",
//         "password_otp": null,
//         "type": "provider"

import '../../modules/location/data/models/country_model.dart';

class UserModel {
  int id;
  String name;
  String email;
  String phone;
  CountryModel? countryModel;
  String image;
  bool isVerified;
  String otp;
  String? passwordOtp;
  String type;
  String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.countryModel,
    required this.image,
    required this.isVerified,
    required this.otp,
    required this.passwordOtp,
    required this.type,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"] ?? "",
        countryModel: json["phone_country"] == null
            ? null
            : CountryModel.fromJson(json["phone_country"] ?? {}),
        image: json["image"] ?? "",
        isVerified: json["is_verified"] ?? false,
        otp: json["otp"] ?? "",
        passwordOtp: json["password_otp"],
        type: json["type"] ?? "",
        token: json["access_token"] ?? "",
      );
}
