import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:recipe_generator/components/customAppBar.dart';
import 'package:recipe_generator/components/elements/carousel.dart';
import 'package:recipe_generator/providers/modules/main.dart';
import 'package:recipe_generator/providers/modules/recipes.dart';

class Home extends StatelessWidget {
  final List<Map> mealsOfDay = [
    {
      'image': 'breakfast.jpg',
      'name': 'Breakfast',
      'category': 'breakfast',
    },
    {
      'image': 'lunch.jpg',
      'name': 'Lunch',
      'category': 'lunch',
    },
    {
      'image': 'dinner.jpg',
      'name': 'Dinner',
      'category': 'dinner',
    },
    {
      'image': 'desserts.jpg',
      'name': 'Desserts',
      'category': 'desserts',
    },
  ];
  final List<Map> healthy = [
    {
      'image': 'vegan.jpg',
      'name': 'Vegan',
      'category': 'health',
    },
    {
      'image': 'vegetarian.jpg',
      'name': 'Vegetarian',
      'category': 'health',
    },
    {
      'image': 'lowsugar.jpg',
      'name': 'Low-Sugar',
      'category': 'health',
    },
    {
      'image': 'nutfree.jpg',
      'name': 'Gluten-Free',
      'category': 'health',
      'subcategory': 'gluten-free',

    },
  ];
  final List<Map> diet = [
    {
      'image': 'vegan.jpg',
      'name': 'Balanced',
      'category': 'diet',
      'subcategory': 'balanced',
    },
    {
      'image': 'vegetarian.jpg',
      'name': 'High-Protein',
      'category': 'diet',
      'subcategory': 'high-protein',
    },
    {
      'image': 'lowsugar.jpg',
      'name': 'Low-Carb',
      'category': 'diet',
      'subcategory': 'low-carb',
    },
    {
      'image': 'nutfree.jpg',
      'name': 'Low-Fat',
      'category': 'diet',
      'subcategory': 'low-fat',
    },
  ];
  final List<Map> culture = [
    {
      'image': 'vegan.jpg',
      'name': 'American',
      'category': 'american',
    },
    {
      'image': 'vegetarian.jpg',
      'name': 'Asian',
      'category': 'asian',
    },
    {
      'image': 'lowsugar.jpg',
      'name': 'French',
      'category': 'french',
    },
    {
      'image': 'nutfree.jpg',
      'name': 'Hungarian',
      'category': 'hungarian',
    },
    {
      'image': 'nutfree.jpg',
      'name': 'Indian',
      'category': 'indian',
    },
    {
      'image': 'nutfree.jpg',
      'name': 'Italian',
      'category': 'italian',
    },
    {
      'image': 'nutfree.jpg',
      'name': 'Mexican',
      'category': 'mexican',
    },
    {
      'image': 'nutfree.jpg',
      'name': 'Persian',
      'category': 'persian',
    },
  ];

  Future<void> clearStorage(BuildContext context) async {
    await Provider.of<MainState>(context, listen: false).clearStorage();
  }

  navigateTo(BuildContext context, index, category) async {
    Map selectedCategory = Provider.of<RecipeState>(context, listen: false).selectedCategory;
    if (selectedCategory != category) {
      Provider.of<RecipeState>(context, listen: false).cleanRecipes();
      Provider.of<RecipeState>(context, listen: false).setCategory(category);
    }
    Navigator.pushNamed(context, '/recipes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(text1: 'Choose your', text2: 'Food Category',),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Meals of the day',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Carousel(
                      list: mealsOfDay,
                      length: mealsOfDay.length,
                      method: navigateTo,
                    ),
                    Text(
                      'Healthy',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Carousel(
                      list: healthy,
                      length: healthy.length,
                      method: navigateTo,
                    ),
                    Text(
                      'Diet',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Carousel(
                      list: diet,
                      length: diet.length,
                      method: navigateTo,
                    ),
                    Text(
                      'Culture',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Carousel(
                      list: culture,
                      length: culture.length,
                      method: navigateTo,
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clearStorage(context);
        },
        child: Icon(Icons.add_comment),
        backgroundColor: Colors.green,
      ),
    );
  }
}
