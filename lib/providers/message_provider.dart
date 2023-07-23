import 'dart:convert';

import 'package:chatteree_mobile/models/message_model.dart';
import 'package:chatteree_mobile/repositories/message_repository.dart';
import 'package:flutter/material.dart';

class MessageProvider with ChangeNotifier {
  List<Message> _userMessageList = [];

  List<Message> get userMessageList => _userMessageList;

  set userMessageList(List<Message> data) {
    _userMessageList = data;
    notifyListeners();
  }

  Future setUserMessageList() async {
    final List<Map<String, dynamic>> messageListFromRepo =
        MessageRepository().fetchMessageListFromRepo();

    final messageList = messageListFromRepo.map((message) {
      var jsonMessage = jsonEncode(message);
      return messageFromJson(jsonMessage);
    }).toList();

    userMessageList = messageList;
  }
}