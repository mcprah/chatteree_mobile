import 'dart:convert';

import 'package:chatteree_mobile/models/film_model.dart';
import 'package:chatteree_mobile/repositories/film_repository.dart';
import 'package:flutter/material.dart';

class FilmProvider with ChangeNotifier {
  List<Film> _filmList = [];
  List<Film> get filmList => _filmList;

  set filmList(List<Film> films) {
    _filmList = films;
    notifyListeners();
  }

  Future setUserFilmList() async {
    final List<Map<String, dynamic>> filmListFromRepo =
        FilmRepository().fetchFilmListFromRepo();

    final films = filmListFromRepo.map((message) {
      var jsonMessage = jsonEncode(message);
      return filmFromJson(jsonMessage);
    }).toList();

    filmList = films;
  }
}
