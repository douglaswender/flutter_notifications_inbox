// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationModel {
  String body;
  String title;
  NotificationModel({
    required this.body,
    required this.title,
  });

  NotificationModel copyWith({
    String? body,
    String? title,
  }) {
    return NotificationModel(
      body: body ?? this.body,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
      'title': title,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      body: map['body'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Notification(body: $body, title: $title)';

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.body == body && other.title == title;
  }

  @override
  int get hashCode => body.hashCode ^ title.hashCode;
}
