import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meals_provider.dart';
import 'package:meals_app/screen/filters.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}
class FilterNotifier extends StateNotifier<Map<Filter,bool>>{
  FilterNotifier() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });
  void setFilters(Map<Filter,bool>chosenFilters) {
    state = chosenFilters;
  }
  void setFilter(Filter filter,bool isActive) {
    state ={
      ...state,
      filter: isActive,
    };
  }
}

final FiltersProvider = StateNotifierProvider<FilterNotifier,Map<Filter,bool>>((ref) => FilterNotifier(),);

final filteredMealsProvider = Provider((ref) {
 final meals= ref.watch(MealsProvider);
 final activeFilters = ref.watch(FiltersProvider);
  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
  }


  );


