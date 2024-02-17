import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExProvider extends StateNotifier<List<String>> {
  ExProvider() : super([]);

  int elementCount() {
    return state.length;
  }

  void addElement(String element) {
    state = [...state, element];
  }

  void removeElement(String element) {
    state = state.where((e) => e != element).toList();
  }
}

final stateCount = StateNotifierProvider<ExProvider, List<String>>((ref) {
  return ExProvider();
});
