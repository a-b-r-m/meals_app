import 'package:flutter/cupertino.dart';
import 'package:meals_app/provider/filters_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screen/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';



class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key,});




  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters = ref.watch(FiltersProvider);
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Your Filters'
        ),
      ),
     // drawer: MainDrawer(onSelectScreen: (identifier) {
       // Navigator.of(context).pop();
       // if (identifier == 'meals')  {
         // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>const TabsScreen()));
        //}
      //},),
      body:
          // same code as shown in the next lecture

         Column(
          children: [
            SwitchListTile(
                value: activeFilters[Filter.glutenFree]!,
                onChanged: (isChecked) {
                ref.read(FiltersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
                },
            title: Text('Gluten-free',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color:Theme.of(context).colorScheme.onBackground ,fontSize: 20,fontWeight: FontWeight.normal),

            ),
              subtitle: Text('Only include gluten-free meals',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:Theme.of(context).colorScheme.onBackground,fontSize: 14),
            ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref.read(FiltersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text('Lactose-free',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:Theme.of(context).colorScheme.onBackground ,fontSize: 20,fontWeight: FontWeight.normal),

              ),
              subtitle: Text('Only include lactose-free meals',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color:Theme.of(context).colorScheme.onBackground,fontSize: 14),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(FiltersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
              title: Text('Vegetarian',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:Theme.of(context).colorScheme.onBackground ,fontSize: 20,fontWeight: FontWeight.normal),

              ),
              subtitle: Text('Only include vegetarian meals',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color:Theme.of(context).colorScheme.onBackground,fontSize: 14),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:const EdgeInsets.only(left: 34,right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref.read(FiltersProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: Text('Vegan',style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:Theme.of(context).colorScheme.onBackground ,fontSize: 20,fontWeight: FontWeight.normal),

              ),
              subtitle: Text('Only include vegan meals',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color:Theme.of(context).colorScheme.onBackground,fontSize: 14),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:const EdgeInsets.only(left: 34,right: 22),
            )
          ],
        )
    );


  }

}