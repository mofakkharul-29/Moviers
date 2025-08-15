// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviers/repository/movie_provider.dart';
import 'package:moviers/widgets/specific_movie.dart';

class Topchart extends ConsumerWidget {
  const Topchart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topRatedMovies = ref.watch(
      topChartMoviesProvider,
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 10, 10, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Top Charts',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => onSkipTap(context),
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color.fromRGBO(158, 158, 158, 1),
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.6,
            ),
        itemCount: topRatedMovies.length,
        itemBuilder: (context, index) {
          final movie = topRatedMovies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpecificMovie(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                    child: Image.asset(
                      movie.posterPath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.rating,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Text(
                          movie.year,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          ' • ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          movie.duration,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onSkipTap(BuildContext context) {
    Navigator.of(context).pop();
  }
}
