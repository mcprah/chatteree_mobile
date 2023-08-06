// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

import 'package:chatteree_mobile/models/user_model.dart';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  final User from;
  final String? dateTime;
  final int? unreadCount;
  final List<Value>? value;

  Message({
    required this.from,
    this.dateTime,
    this.unreadCount,
    this.value,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        from: User.fromJson(json["from"]),
        dateTime: json["date_time"],
        unreadCount: json["unread_count"],
        value: json["value"] == null
            ? []
            : List<Value>.from(json["value"]!.map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "from": from.toJson(),
        "date_time": dateTime,
        "unread_count": unreadCount,
        "value": value == null
            ? []
            : List<dynamic>.from(value!.map((x) => x.toJson())),
      };
}

class Value {
  final int? userId;
  final String? text;
  final String? dateTime;

  Value({
    this.userId,
    this.text,
    this.dateTime,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        userId: json["user_id"],
        dateTime: json["date_time"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "date_time": dateTime,
        "text": text,
      };
}
