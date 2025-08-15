import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviers/Model/movie_model.dart';
import 'package:moviers/widgets/payment_modal.dart';

final watchlistProvider = StateProvider<List<Movie>>(
  (ref) => [],
);

class SpecificMovie extends ConsumerStatefulWidget {
  final Movie? movie;

  const SpecificMovie({super.key, this.movie});

  @override
  ConsumerState<SpecificMovie> createState() =>
      _SpecificMovieState();
}

class _SpecificMovieState
    extends ConsumerState<SpecificMovie> {
  final String _fullDescription =
      "A Star Wars Story itself focuses on the Rebel Alliance which recruits Jyn Erso (Felicity Jones) after the formation of the Galaxy earning his living. Told there is a woman named Jyn Erso (Felicity Jones). A rebel soldier and criminal is about to face his greatest challenge when Mon Mothma (Genevieve O'Reilly) sends him on a dangerous mission. Jyn is tasked with stealing the plans for the Death Star, the Empire's weapon of mass destruction that could destroy a planet. With the help of rebel strongholds, swordsmen, and other troops, Jyn will become part of something very big she never thought of before.";

  void _showFullDescriptionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(10, 10, 10, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Rogue One: A Star Wars \nStory',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _fullDescription,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final movie =
        widget.movie ??
        Movie(
          title: 'Rogue One: A Star Wars Story',
          posterPath: 'assets/images/hero.jpg',
          rating: '8.4',
          year: '2016',
          duration: '1h 54m',
          genre: 'Sci-Fi',
        );

    final watchlist = ref.watch(watchlistProvider);
    final isBookmarked = watchlist.contains(movie);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 10, 10, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(movie.posterPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color.fromRGBO(10, 10, 10, 0.7),
                          Color.fromRGBO(10, 10, 10, 1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.5, 0.8, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.rating,
                            style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            movie.year,
                            style: const TextStyle(
                              color: Color.fromRGBO(
                                158,
                                158,
                                158,
                                1,
                              ),
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            movie.duration,
                            style: const TextStyle(
                              color: Color.fromRGBO(
                                158,
                                158,
                                158,
                                1,
                              ),
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            movie.genre,
                            style: const TextStyle(
                              color: Color.fromRGBO(
                                158,
                                158,
                                158,
                                1,
                              ),
                              fontSize: 14,
                              fontFamily: 'Helvetica Neue',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.5,
                    fontFamily: 'Helvetica Neue',
                  ),
                  children: [
                    TextSpan(
                      text:
                          _fullDescription.length > 150
                              ? '${_fullDescription.substring(0, 150)}...'
                              : _fullDescription,
                    ),
                    if (_fullDescription.length > 150)
                      TextSpan(
                        text: ' More',
                        style: const TextStyle(
                          color: Color(0xFF1F80FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                _showFullDescriptionModal(
                                  context,
                                );
                              },
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trailers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/rogue_one.jpg',
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.6,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        showPaymentBottomSheet(context);
                      },
                      icon: const Icon(
                        Icons.play_circle_rounded,
                        size: 24,
                      ),
                      label: const Text('Watch Movie'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF1F80FF,
                        ),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        final watchlist = ref.read(
                          watchlistProvider.notifier,
                        );
                        if (isBookmarked) {
                          watchlist.state =
                              watchlist.state
                                  .where(
                                    (m) =>
                                        m.title !=
                                        movie.title,
                                  )
                                  .toList();
                        } else {
                          watchlist.state = [
                            ...watchlist.state,
                            movie,
                          ];
                        }
                      },
                      icon: Icon(
                        isBookmarked
                            ? Icons.bookmark
                            : Icons
                                .bookmark_border_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
