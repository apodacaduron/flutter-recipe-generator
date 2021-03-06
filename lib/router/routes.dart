import 'package:flutter/widgets.dart';

import 'package:recipe_generator/views/home.dart';
import 'package:recipe_generator/views/recipeDetail.dart';
import 'package:recipe_generator/views/recipes.dart';

Route customRoutes(namedRoutes, arguments) {
  switch (namedRoutes) {
    case '/home':
      return _createRoute(Home());
    case '/recipes':
      return _createRoute(Recipe());
    case '/recipe-detail':
      return _createRoute(RecipeDetail());
    default:
      return _createRoute(Home());
  }
}

Route _createRoute(Widget redirectTo) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => redirectTo,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}