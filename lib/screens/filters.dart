import 'package:flutter/material.dart';
// import 'package:foodie/screens/tabs.dart';
// import 'package:foodie/widgets/main_drawer.dart';
import 'package:foodie_application/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum Filter {
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,
// }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  // final Map<Filter, bool> currentFilters;
//   @override
//   ConsumerState<FiltersScreen> createState() {
//     return _FiltersScreenState();
//   }
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

  // @override
  // void initState() {
  //   super.initState();
  //   final activeFilter = ref.read(filtersProvider);
  //   _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = activeFilter[Filter.vegetarian]!;
  //   _veganFilterSet = activeFilter[Filter.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters =  ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context)
      //           .pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //     }
      //   },
      // ),
      // body: WillPopScope(
      //   onWillPop: () async {
      //     ref.read(filtersProvider.notifier).setFilters({
      //       Filter.glutenFree: _glutenFreeFilterSet,
      //       Filter.lactoseFree: _lactoseFreeFilterSet,
      //       Filter.vegetarian: _veganFilterSet,
      //       Filter.vegan: _veganFilterSet,
      //     });
      //     // Navigator.of(context).pop();
      //     return true;
      //   },
      body: Column(children: [
        SwitchListTile(
          value: activeFilters[Filter.Vegetarian]!,
          onChanged: (isChecked) {
            // setState(() {
            //   _glutenFreeFilterSet = isChecked;
            // });
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.Vegetarian, isChecked);
          },
          title: Text(
            'Gluten-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'Only include gluten-free meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilters[Filter.Sweet]!,
          onChanged: (isChecked) {
            // setState(() {
            //   _glutenFreeFilterSet = isChecked;
            // });
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.Sweet, isChecked);
          },
          title: Text(
            'Lactose-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'Only include lactose-free meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
         value: activeFilters[Filter.Healthy]!,
          onChanged: (isChecked) {
            // setState(() {
            //   _glutenFreeFilterSet = isChecked;
            // });
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.Healthy, isChecked);
          },
          title: Text(
            'Vegetarian',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'Only include vegetarian meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilters[Filter.Quick]!,
          onChanged: (isChecked) {
            // setState(() {
            //   _glutenFreeFilterSet = isChecked;
            // });
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.Quick, isChecked);
          },
          title: Text(
            'Vegan',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            'Only include vegan meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
      ]),
      // ),
    );
  }
}
