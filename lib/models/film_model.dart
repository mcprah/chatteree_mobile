import 'dart:convert';

Film filmFromJson(String str) => Film.fromJson(json.decode(str));

String filmToJson(Film data) => json.encode(data.toJson());

class Film {
  final String thumbnailUrl;
  final String username;
  final bool? hasUnviewedFilm;

  Film({
    required this.thumbnailUrl,
    required this.username,
    this.hasUnviewedFilm,
  });

  factory Film.fromJson(Map<String, dynamic> json) => Film(
        thumbnailUrl: json["thumbnailUrl"],
        username: json["username"],
        hasUnviewedFilm: json["hasUnviewedFilm"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnailUrl": thumbnailUrl,
        "username": username,
        "hasUnviewedFilm": hasUnviewedFilm,
      };
}
