import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviers/Model/star_model.dart';

final topStarsProvider = Provider<List<TopStars>>((ref) {
  return [
    TopStars(
      name: 'Chris Evans',
      imagePath: 'assets/images/chris.jpg',
    ),
    TopStars(
      name: 'Robert Downey',
      imagePath: 'assets/images/robert.jpg',
    ),
    TopStars(
      name: 'Emma Watson',
      imagePath: 'assets/images/ema_one.jpg',
    ),
    TopStars(
      name: 'Will Smith',
      imagePath: 'assets/images/will.jpg',
    ),
    TopStars(
      name: 'Jim Carrey',
      imagePath: 'assets/images/jim.jpg',
    ),
    TopStars(
      name: 'Chris Evans',
      imagePath: 'assets/images/chris.jpg',
    ),
  ];
});
