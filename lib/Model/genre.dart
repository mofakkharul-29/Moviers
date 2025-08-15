class Genre {
  final String id;
  final String name;
  final String imageUrl;
  final int likes;

  const Genre({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.likes,
  });
}

const List<Genre> availableGenres = [
  Genre(
    id: 'g1',
    name: 'Action',
    imageUrl: 'assets/images/action.jpg',
    likes: 4324,
  ),
  Genre(
    id: 'g2',
    name: 'Adventure',
    imageUrl: 'assets/images/adventure.jpg',
    likes: 2592,
  ),
  Genre(
    id: 'g3',
    name: 'Comedy',
    imageUrl: 'assets/images/comedy.jpg',
    likes: 920,
  ),
  Genre(
    id: 'g4',
    name: 'Drama',
    imageUrl: 'assets/images/drama.jpg',
    likes: 1423,
  ),
  Genre(
    id: 'g5',
    name: 'Sci-Fi',
    imageUrl: 'assets/images/sci.jpg',
    likes: 3120,
  ),
  Genre(
    id: 'g6',
    name: 'Horror',
    imageUrl: 'assets/images/horror.jpg',
    likes: 1800,
  ),
];
