import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:recipe_generator/components/customAppBar.dart';
import 'package:recipe_generator/components/elements/carousel.dart';
import 'package:recipe_generator/providers/modules/main.dart';

class Home extends StatelessWidget {
  final List<Map> mealsOfDay = [
    {
      'image': 'breakfast.jpg',
      'type': 'Breakfast',
    },
    {
      'image': 'lunch.jpg',
      'type': 'Lunch',
    },
  ];
  Future<void> clearStorage(BuildContext context) async {
    await Provider.of<MainState>(context, listen: false).clearStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
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
                    ),
                    Text(
                      'Healthy',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Carousel(
                      list: mealsOfDay,
                      length: mealsOfDay.length,
                    ),
                    Text(
                      'Diet',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Carousel(
                      list: mealsOfDay,
                      length: mealsOfDay.length,
                    ),
                    Text(
                      'Culture',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Carousel(
                      list: mealsOfDay,
                      length: mealsOfDay.length,
                    ),
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
