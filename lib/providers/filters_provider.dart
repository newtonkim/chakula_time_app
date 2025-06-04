// import 'package:chakula_time/screens/filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum to represent the different filters for better type safety and readability
enum Filter { glutenFree, lactoseFree, vegan, vegetarian }


class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });


  

  void setFilter(Filter filter, bool isActive){
    state = {
      ...state,
      filter: isActive,
    };
  
  }

}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
      return FiltersNotifier();
    });
