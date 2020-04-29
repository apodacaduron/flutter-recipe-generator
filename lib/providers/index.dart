import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:recipe_generator/providers/modules/main.dart';
import 'package:recipe_generator/providers/modules/recipes.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => MainState()),
  ChangeNotifierProxyProvider<MainState, RecipeState>(
    create: (context) => RecipeState(),
    update: (context, mainState, prevRecipeState) => prevRecipeState..update(mainState.api, mainState.headers),
  ),
];
