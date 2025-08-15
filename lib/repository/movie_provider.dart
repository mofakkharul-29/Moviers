import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviers/Model/movie_model.dart';

class TopChartMoviesNotifier
    extends StateNotifier<List<Movie>> {
  TopChartMoviesNotifier()
    : super([
        Movie(
          title: 'Dune',
          posterPath: 'assets/images/hero.jpg',
          rating: '8.0',
          year: '2021',
          duration: '2h 35m',
          genre: 'Sci-Fi',
        ),
        Movie(
          title: 'Avatar',
          posterPath: 'assets/images/avatar.jpg',
          rating: '9.4',
          year: '2024',
          duration: '3h 20m',
          genre: 'Sci-Fi',
        ),
        Movie(
          title: 'Maleficent',
          posterPath: 'assets/images/mal.jpeg',
          rating: '7.0',
          year: '2014',
          duration: '1h 37m',
          genre: 'Fantasy',
        ),
        Movie(
          title: 'All The Bright Places',
          posterPath: 'assets/images/atbp.jpg',
          rating: '8.0',
          year: '2021',
          duration: '2h 35m',
          genre: 'Sci-Fi',
        ),
        Movie(
          title: 'Harry Potter',
          posterPath: 'assets/images/harry.png',
          rating: '8.4',
          year: '2001',
          duration: '2h 32m',
          genre: 'Fantasy',
        ),
        Movie(
          title: 'The Beauty & The Beast',
          posterPath: 'assets/images/bb.jpg',
          rating: '8.4',
          year: '2001',
          duration: '2h 32m',
          genre: 'Fantasy',
        ),
      ]);

  void updatePoster(int index, String newPath) {
    final updatedList = [...state];
    updatedList[index] = updatedList[index].copyWith(
      posterPath: newPath,
    );
    state = updatedList;
  }
}

final topChartMoviesProvider = StateNotifierProvider<
  TopChartMoviesNotifier,
  List<Movie>
>((ref) => TopChartMoviesNotifier());
