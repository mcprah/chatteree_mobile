import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chatteree_mobile/providers/film_provider.dart';
import 'package:chatteree_mobile/view/components/film/user_film.dart';

class FilmList extends StatelessWidget {
  const FilmList({super.key});

  @override
  Widget build(BuildContext context) {
    FilmProvider filmProvider = context.watch<FilmProvider>();

    return Row(
      children: [
        ...filmProvider.filmList.map((film) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: UserFilm(
              thumbnailUrl: film.thumbnailUrl,
              username: film.username,
              hasUnviewedFilm: film.hasUnviewedFilm,
            ),
          );
        }),
      ],
    );
  }
}
