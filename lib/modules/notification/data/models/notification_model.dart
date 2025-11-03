class NotificationModel {
  int? id;
  String? title;
  String? body;
  DateTime? createdAt;
  String? type;

  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.type,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    createdAt = DateTime.parse(json['created_at']);
    type = json['type'];
  }
}
