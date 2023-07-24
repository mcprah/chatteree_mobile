class FilmRepository {
  List<Map<String, dynamic>> fetchFilmListFromRepo() {
    List<Map<String, dynamic>> filmDataList = [
      {
        "thumbnailUrl": "https://i.pravatar.cc/150?u=a042581f4e2902ds04d",
        "username": "Alex Smith",
        "hasUnviewedFilm": true,
      },
      {
        "thumbnailUrl": "https://i.pravatar.cc/150?u=3a4b3d205c24cd9",
        "username": "Emma Johnson",
        "hasUnviewedFilm": false,
      },
      {
        "thumbnailUrl": "https://i.pravatar.cc/150?u=9e5ba023f470a28",
        "username": "John Doe",
        "hasUnviewedFilm": true,
      },
      {
        "thumbnailUrl": "https://i.pravatar.cc/150?u=59b7cc4a2711b92",
        "username": "Sophia Williams",
        "hasUnviewedFilm": true,
      },
      {
        "thumbnailUrl": "https://i.pravatar.cc/150?u=b198b97e4c2e2a1",
        "username": "Daniel Brown",
        "hasUnviewedFilm": false,
      },
      {
        "thumbnailUrl": "https://i.pravatar.cc/150?u=1c97a43e2207db9",
        "username": "Olivia Miller",
        "hasUnviewedFilm": true,
      },
      {
        "thumbnailUrl": "https://i.pravatar.cc/150?u=c6e4a6ed854c18c",
        "username": "William Martinez",
        "hasUnviewedFilm": false,
      },
      {
        "thumbnailUrl": "https://i.pravatar.cc/150?u=76e4a9bc1a6f86e",
        "username": "Ava Davis",
        "hasUnviewedFilm": true,
      },
    ];

    return filmDataList;
  }
}
