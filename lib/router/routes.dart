import 'package:flutter/widgets.dart';

import 'package:recipe_generator/views/home.dart';

Route customRoutes(namedRoutes, arguments) {
  switch (namedRoutes) {
    case '/home':
      return _createRoute(Home());
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