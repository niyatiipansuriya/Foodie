import 'package:flutter/material.dart';
// import 'package:foodie/data/dummy_data.dart';
// import 'package:foodie/models/meal.dart';
import 'package:foodie_application/screens/categories.dart';
import 'package:foodie_application/screens/filters.dart';
import 'package:foodie_application/screens/meals.dart';
import 'package:foodie_application/widgets/main_drawer.dart';
// import 'package:foodie/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie_application/providers/favorites_provider.dart';
import 'package:foodie_application/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.Vegetarian: false,
  Filter.Sweet: false,
  Filter.Quick: false,
  Filter.Healthy: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // Map<Filter, bool> _selectedFilter = {
  //   Filter.glutenFree: false,
  //   Filter.lactoseFree: false,
  //   Filter.vegan: false,
  //   Filter.vegetarian: false
  // };

  // void _showInfoMessage(String message) {}

  // void _toggleMealFavoriteStatue(Meal meal) {
  //   final isExiting = _favoritMeals.contains(meal);

  //   if (isExiting) {
  //     setState(() {
  //       _favoritMeals.remove(meal);
  //       _showInfoMessage('Meal is no longerin a favorite list!');
  //     });
  //   } else {
  //     setState(() {
  //       _favoritMeals.add(meal);
  //       _showInfoMessage('Marked as a favorite!');
  //     });
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Future<void> _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final meals = ref.watch(mealsProvider);
    // final activeFilters = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filterMealsProvider);
    Widget activePage = CategoriesScreen(
      // onToggleFavorite: _toggleMealFavoriteStatue,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
        // onToggleFavorites: _toggleMealFavoriteStatue,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
