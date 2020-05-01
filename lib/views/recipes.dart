import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_generator/components/customAppBar.dart';
import 'package:recipe_generator/components/elements/recipeCard.dart';
import 'package:recipe_generator/providers/modules/recipes.dart';

class Recipe extends StatefulWidget {
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  final scrollController = ScrollController();

  Future<void> loadCategory(BuildContext context) async {
    await Provider.of<RecipeState>(context, listen: false)
        .loadCategory(context);
  }

  void moreRecipes() {
    Provider.of<RecipeState>(context, listen: false).moreRecipes();
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        moreRecipes();
        loadCategory(context);
        print('entro');
      }
    });
    super.initState();
    loadCategory(context);
  }

  buildList(BuildContext context, RecipeState recipeState) {
    // if (!_loading || !isEmpty) {
    if (recipeState.recipes != null && recipeState.recipes.length > 0) {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recipeState.recipes.length,
        itemBuilder: (context, index) {
          if (index < recipeState.recipes.length) {
            final item = recipeState.recipes[index];
            return RecipeCard(
              recipe: item['recipe'],
              // selectHandler: setSelectedRfi,
            );
          }
        },
      );
    } else if (recipeState.recipes == null) {
      return Container(
        height: MediaQuery.of(context).size.height - 250,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      // return NoResults();
    }
    // }
    // return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<RecipeState>(
        builder: (context, recipeState, _) => Container(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                CustomAppBar(
                    text1: 'Time to select',
                    text2: recipeState.selectedCategory['name']),
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: buildList(context, recipeState),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.add_comment),
        backgroundColor: Colors.green,
      ),
    );
  }
}
