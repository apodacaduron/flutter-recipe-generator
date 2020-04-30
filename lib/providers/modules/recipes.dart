import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

import 'package:recipe_generator/components/alert.dart';

class RecipeState with ChangeNotifier {
  String _api;
  Map<String, String> _headers;
  void update(String api, Map<String, String> headers) {
    _api = api;
    _headers = headers;
  }

  // State
  List recipes;
  Map selectedRecipe;

  RecipeState();
  // Getters

  // Mutations

  // Actions
  Future loadCategory(BuildContext context, Map payload) async {
    try {
      final res = await http.get('$_api&q=${payload['category']}&from=0&to=20', headers: _headers);
      var response = json.decode(res.body);
      if (response['error'] != null) {
        showDialog(context: context, child: Alert(title: 'Oops...', text: 'Something went wrong'));
      }
      notifyListeners();
    } catch (e) {
      showDialog(context: context, child: Alert(title: 'Oops...', text: 'An error occurred, please try again.'));
      print(e);
    }
  }
}