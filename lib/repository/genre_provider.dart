import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedGenreNotifier
    extends StateNotifier<List<String>> {
  SelectedGenreNotifier() : super([]);

  void toggleGenreSelection(String genreId) {
    if (state.contains(genreId)) {
      state = state.where((id) => id != genreId).toList();
    } else {
      state = [...state, genreId];
    }
  }
}

final selectedGenresProvider = StateNotifierProvider<
  SelectedGenreNotifier,
  List<String>
>((ref) {
  return SelectedGenreNotifier();
});

final selectedGenresCountProvider = Provider<int>((ref) {
  final selectedGenres = ref.watch(selectedGenresProvider);
  return selectedGenres.length;
});
