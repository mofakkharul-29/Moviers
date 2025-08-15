class Movie {
  final String title;
  final String posterPath;
  final String rating;
  final String year;
  final String duration;
  final String genre;

  Movie({
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.year,
    required this.duration,
    required this.genre,
  });

  Movie copyWith({
    String? title,
    String? posterPath,
    String? rating,
    String? year,
    String? duration,
    String? genre,
  }) {
    return Movie(
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      rating: rating ?? this.rating,
      year: year ?? this.year,
      duration: duration ?? this.duration,
      genre: genre ?? this.genre,
    );
  }
}
