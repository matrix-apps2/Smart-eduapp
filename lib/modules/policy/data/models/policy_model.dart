class PolicyModel {
  final String title;
  final String content;
  
  PolicyModel({
    required this.title,
    required this.content,
  });

  factory PolicyModel.fromJson(Map<String, dynamic> json) {
    return PolicyModel(
      title: json['name'] ?? "",
      content: json['content'],
    );
  }
}
