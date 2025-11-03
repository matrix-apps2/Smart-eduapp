class SettingFeatureModel {
    final String featureName;
    final String featureFullName;

    SettingFeatureModel({
        required this.featureName,
        required this.featureFullName,
    });

    factory SettingFeatureModel.fromJson(Map<String, dynamic> json) => SettingFeatureModel(
        featureName: json["featureName"],
        featureFullName: json["featureFullName"],
    );

    Map<String, dynamic> toJson() => {
        "featureName": featureName,
        "featureFullName": featureFullName,
    };
}
