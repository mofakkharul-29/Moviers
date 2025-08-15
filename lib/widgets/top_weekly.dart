import 'package:flutter_riverpod/flutter_riverpod.dart';

final topChartProvider = Provider<List<String>>((ref) {
  return [
    'assets/images/dune.jpg',
    'assets/images/harry.png',
    'assets/images/mal.jpeg',
    'assets/images/dune.jpg',
    'assets/images/harry.png',
  ];
});

final weeklyHighlightsProvider = Provider<List<String>>((
  ref,
) {
  return [
    'assets/images/mal.jpeg',
    'assets/images/harry.png',
    'assets/images/dune.jpg',
    'assets/images/harry.png',
    'assets/images/dune.jpg',
  ];
});

final movieTitleProvider = Provider<List<String>>((ref) {
  return [
    'Dune',
    'Harry Potter',
    'Maleficent',
    'Dune',
    'Harry Potter',
  ];
});

final movieRatingsProvider = Provider<List<String>>((ref) {
  return ['8.0', '8.4', '7.0', '8.0', '8.4'];
});

final movieYearsProvider = Provider<List<String>>((ref) {
  return ['2021', '2001', '2014', '2021', '2001'];
});

final movieDurationProvider = Provider<List<String>>((ref) {
  return ['2h 35m', '2h 32m', '1h 37m', '2h 35m', '2h 32m'];
});

final movieGenreProvider = Provider<List<String>>((ref) {
  return [
    'Sci-Fi',
    'Fantasy',
    'Fantasy',
    'Sci-Fi',
    'Fantasy',
  ];
});

final topChartPageProvider = StateProvider<int>((ref) => 0);
