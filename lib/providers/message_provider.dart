import 'dart:convert';

import 'package:chatteree_mobile/models/message_model.dart';
import 'package:chatteree_mobile/repositories/message_repository.dart';
import 'package:flutter/material.dart';

class MessageProvider with ChangeNotifier {
  List<Message> _userMessageList = [];
  Message? _activeMessage;

  List<Message> get userMessageList => _userMessageList;
  Message? get activeMessage => _activeMessage;

  set userMessageList(List<Message> data) {
    _userMessageList = data;
    notifyListeners();
  }

  set activeMessage(Message? message) {
    _activeMessage = message;
    notifyListeners();
  }

  Future setUserMessageList() async {
    final List<Map<String, dynamic>> messageListFromRepo =
        MessageRepository().fetchMessageListFromRepo();

    final messageList = messageListFromRepo.map((message) {
      var jsonMessage = jsonEncode(message);
      return messageFromJson(jsonMessage);
    }).toList();

    userMessageList = messageList.reversed.toList();
  }

  sendMessage({required String text, required int userId}) {
    activeMessage!.value!.insert(0, Value(
      userId: userId,
      text: text.trim(),
      dateTime: "now",
    ));
    notifyListeners();
  }
}
