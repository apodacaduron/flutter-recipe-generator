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
  List<dynamic> recipes;
  Map selectedCategory;
  Map selectedRecipe;
  bool isLoading = true;
  Map pagination;

  RecipeState({
    this.pagination = const {
      'from': 0,
      'to': 24,
      'more': true,
    },
  });
  // Getters

  // Mutations
  void setCategory(Map category) {
    selectedCategory = category;
  }

  void setRecipes(Map response) {
    recipes == null ? recipes = response['hits'] : recipes.addAll(response['hits']);
    pagination['from'] = response['from'];
    pagination['to'] = response['to'];
    pagination['more'] = response['more'];
  }

  void cleanRecipes() {
    recipes = null;
    pagination = {'from': 0, 'to': 20, 'more': true};
  }

  void moreRecipes() {
    pagination = {'from': pagination['from'] + 20, 'to': pagination['to'] + 20, 'more': true};
  }

  // Actions
  Future loadCategory(BuildContext context) async {
    try {
      isLoading = true;
      String query = selectedCategory['subcategory'] != null
          ? '${selectedCategory['category']}=${selectedCategory['subcategory']}'
          : '${selectedCategory['category']}';
      final res = await http.get(
          '$_api&q=$query&from=${pagination['from'].toString()}&to=${pagination['to'].toString()}',
          headers: _headers);
      var response = json.decode(res.body);
      if (response['error'] != null) {
        showDialog(
            context: context,
            child: Alert(title: 'Oops...', text: 'Something went wrong'));
      }
      setRecipes(response);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      showDialog(
          context: context,
          child: Alert(
              title: 'Oops...', text: 'An error occurred, please try again.'));
      print(e);
    }
  }

  Future loadRecipe(BuildContext context, Map payload) async {
    try {
      final res = await http.get('$_api&r=${payload['recipe']}&from=0&to=20',
          headers: _headers);
      var response = json.decode(res.body);
      if (response['error'] != null) {
        showDialog(
            context: context,
            child: Alert(title: 'Oops...', text: 'Something went wrong'));
      }
      notifyListeners();
    } catch (e) {
      showDialog(
          context: context,
          child: Alert(
              title: 'Oops...', text: 'An error occurred, please try again.'));
      print(e);
    }
  }
}
