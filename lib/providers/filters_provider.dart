import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie_application/providers/meals_provider.dart';

enum Filter {
  Vegetarian,
  Sweet,
  Healthy,
  Quick,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.Vegetarian: false,
          Filter.Sweet: false,
          Filter.Healthy: false,
          Filter.Quick: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filterMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilters[Filter.Vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.Sweet]! && !meal.isSweet) {
      return false;
    }
    if (activeFilters[Filter.Healthy]! && !meal.isHealthy) {
      return false;
    }
    if (activeFilters[Filter.Quick]! && !meal.isQuick) {
      return false;
    }
    return true;
  }).toList();
});
