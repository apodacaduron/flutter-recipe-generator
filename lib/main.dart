import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:recipe_generator/providers/index.dart';
import 'package:recipe_generator/providers/modules/main.dart';
import 'package:recipe_generator/router/routes.dart';
import 'package:recipe_generator/views/home.dart';

import 'package:recipe_generator/views/welcome.dart';

import 'package:recipe_generator/theme/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<MainState>(
        builder: (context, mainState, _) => MaterialApp(
          title: 'Food Generator',
          theme: appTheme(),
          home: StreamBuilder<Object>(
            stream: mainState.readStoredToken(),
            initialData: false,
            builder: (context, snapshot) {
              return !mainState.showWelcome ? Home() : Welcome();
            },
          ),
          onGenerateRoute: (settings) {
            return customRoutes(settings.name, settings.arguments);
          },
        ),
      ),
    );
  }
}
