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
  final String messageSnippet;

  Message({
    required this.from,
    required this.messageSnippet,
    required this.dateTime,
    this.unreadCount = 0,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        from: User.fromJson(json["from"]),
        dateTime: json["date_time"],
        unreadCount: json["unread_count"],
        messageSnippet: json["message_snippet"],
      );

  Map<String, dynamic> toJson() => {
        "from": from.toJson(),
        "date_time": dateTime,
        "unread_count": unreadCount,
        "message_snippet": messageSnippet,
      };
}
