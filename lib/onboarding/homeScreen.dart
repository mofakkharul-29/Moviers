// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviers/repository/stars_providers.dart';
import 'package:moviers/widgets/movie_details.dart';
import 'package:moviers/widgets/specific_movie.dart';
import 'package:moviers/widgets/topChart.dart';
import 'package:moviers/widgets/top_weekly.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularStars = ref.watch(topStarsProvider);
    final topChartUrl = ref.watch(topChartProvider);
    final weeklyHilightUrl = ref.watch(
      weeklyHighlightsProvider,
    );
    final movieTitles = ref.watch(movieTitleProvider);
    final movieRatings = ref.watch(movieRatingsProvider);
    final movieYears = ref.watch(movieYearsProvider);
    final movieDurations = ref.watch(movieDurationProvider);
    final movieGenres = ref.watch(movieGenreProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hero.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rogue One: A Star Wars Story',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '8.4',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontFamily: 'Helvetica Neue',
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '2016',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: 'Helvetica Neue',
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '1h 54m',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: 'Helvetica Neue',
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Sci-Fi',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: 'Helvetica Neue',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // i have to place the functionality here
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
                            padding:
                                const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          // add movie to the watch list if click
                          // i have to add this as well
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius:
                                BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                  255,
                                  102,
                                  102,
                                  102,
                                ),
                                borderRadius:
                                    BorderRadius.circular(
                                      4,
                                    ),
                              ),
                              child: Icon(
                                Icons
                                    .bookmark_border_outlined,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Charts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Helvetica Neue',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => const Topchart(),
                      ),
                    );
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: 'Helvetica Neue',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder:
                  //     (context) => const MovieDetails(),
                  builder:
                      (context) => const SpecificMovie(),
                ),
              );
            },
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topChartUrl.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 24.0 : 0.0,
                      right: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          height: 150,
                          child: Image.asset(
                            topChartUrl[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              movieRatings[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              movieYears[index],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              movieDurations[index],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              movieGenres[index],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Weekly Highlight',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Helvetica Neue',
              ),
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(),
                ),
              );
            },
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      ref
                          .read(
                            topChartPageProvider.notifier,
                          )
                          .state = index;
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: weeklyHilightUrl.length,
                    controller: PageController(
                      viewportFraction: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 24.0 : 0.0,
                          right: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 300,
                              height: 150,
                              child: Image.asset(
                                weeklyHilightUrl[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              movieTitles[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  movieRatings[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  movieDurations[index],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  movieGenres[index],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: List.generate(
                    topChartUrl.length,
                    (index) {
                      final isActive =
                          ref.watch(topChartPageProvider) ==
                          index;
                      return AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        width: isActive ? 4 : 6,
                        height: isActive ? 8 : 6,
                        decoration: BoxDecoration(
                          color:
                              isActive
                                  ? Colors.blue
                                  : Colors.grey,
                          borderRadius:
                              BorderRadius.circular(4),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Popular Stars',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Helvetica Neue',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularStars.length,
                itemBuilder: (context, index) {
                  final star = popularStars[index];
                  return Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 130,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(4),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(4),
                          child: Image.asset(
                            star.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        star.name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
