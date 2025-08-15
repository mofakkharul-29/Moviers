import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviers/Model/genre.dart';
import 'package:moviers/onboarding/root_screen.dart';
import 'package:moviers/repository/genre_provider.dart';

class Personalized extends ConsumerWidget {
  const Personalized({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGenres = ref.watch(
      selectedGenresProvider,
    );
    final selectedCount = ref.watch(
      selectedGenresCountProvider,
    );
    final genreNotifier = ref.read(
      selectedGenresProvider.notifier,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Personalization',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose your genre',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Helvetica Neue',
                  ),
                ),
                Text(
                  '$selectedCount from 6',
                  style: const TextStyle(
                    color: Color(0xFF1F80FF),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.8,
                    ),
                itemCount: availableGenres.length,
                itemBuilder: (context, index) {
                  final genre = availableGenres[index];
                  final isSelected = selectedGenres
                      .contains(genre.id);
                  return GestureDetector(
                    onTap: () {
                      genreNotifier.toggleGenreSelection(
                        genre.id,
                      );
                    },
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(
                                      8.0,
                                    ),
                                child: Image.asset(
                                  genre.imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              if (isSelected)
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(
                                          8.0,
                                        ),
                                    border: Border.all(
                                      color: const Color(
                                        0xFF1F80FF,
                                      ),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              if (isSelected)
                                Positioned(
                                  top: 8,
                                  right: 8,

                                  child: Container(
                                    padding:
                                        const EdgeInsets.all(
                                          2.0,
                                        ),
                                    decoration:
                                        const BoxDecoration(
                                          color: Color(
                                            0xFF1F80FF,
                                          ),
                                          shape:
                                              BoxShape
                                                  .circle,
                                        ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          genre.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Helvetica Neue',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.people_alt_outlined,
                              color: Color.fromRGBO(
                                158,
                                158,
                                158,
                                1,
                              ),
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${genre.likes} like this',
                              style: const TextStyle(
                                color: Color.fromRGBO(
                                  158,
                                  158,
                                  158,
                                  1,
                                ),
                                fontSize: 14,
                                fontFamily:
                                    'Helvetica Neue',
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
        ],
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width - 50,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => const HomeScreen(),
                builder: (context) => const RootScreen(),
              ),
            );
          },
          backgroundColor: const Color.fromRGBO(
            41,
            140,
            255,
            1,
          ),
          foregroundColor: Colors.white,
          label: const Text('Continue'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  void onSkipTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RootScreen()),
    );
  }
}
