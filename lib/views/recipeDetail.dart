import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:recipe_generator/components/elements/donutChart.dart';
import 'package:recipe_generator/components/elements/macroSeries.dart';

import 'package:recipe_generator/providers/modules/recipes.dart';
import 'package:sliver_fill_remaining_box_adapter/sliver_fill_remaining_box_adapter.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetail extends StatefulWidget {
  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  Map recipe = {};
  List<MacroSeries> data = [
    MacroSeries(
      amount: 1,
      label: 'Fats',
      unit: 'g',
      barColor: charts.ColorUtil.fromDartColor(Colors.green[300]),
    ),
    MacroSeries(
      amount: 2,
      label: 'Proteins',
      unit: 'g',
      barColor: charts.ColorUtil.fromDartColor(Colors.green[900]),
    ),
    MacroSeries(
      amount: 3,
      label: 'Carbs',
      unit: 'g',
      barColor: charts.ColorUtil.fromDartColor(Colors.green[600]),
    ),
  ];

  Future<void> loadRecipe(BuildContext context) async {
    setState(() {
      recipe = Provider.of<RecipeState>(context, listen: false).selectedRecipe;
    });
  }

  @override
  void initState() {
    super.initState();
    loadRecipe(context);
  }

  _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0.3,
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(35.0),
              child: Text(''),
            ),
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Opacity(
                          opacity: 0.9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            child: Image.network(
                              recipe['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 350.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Colors.white,
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0.8),
                              Colors.white.withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 45),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.arrow_back),
                        tooltip: 'Go back to recipes list',
                        onPressed: () => Navigator.pop(context),
                      ),
                      Spacer(),
                      Text(
                        'Bon Appetit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                      Spacer(),
                      IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.favorite_border),
                        tooltip: 'Add this recipe to favorites',
                        onPressed: () => null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemainingBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 40, 30, 25),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      recipe['label'],
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'by ${recipe['source']}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        recipe['calories'].round().toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Calories · ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        recipe['ingredients'].length.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Ingredients',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ingredients',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Color.fromRGBO(240, 255, 241, 1),
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: recipe['ingredientLines'].length,
                      itemBuilder: (context, index) {
                        final item = recipe['ingredientLines'][index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Center(
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          title: Text(item),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 250,
                    height: 57,
                    child: RaisedButton(
                      child: Text(
                        'Open Instructions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: () => _launchUrl(recipe['url']),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Macros',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(height: 300, child: DonutPieChart(data)),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green[300],
                          radius: 10,
                        ),
                        Text(
                          ' Fats',
                          style: TextStyle(),
                        ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.green[600],
                          radius: 10,
                        ),
                        Text(
                          ' Carbs',
                          style: TextStyle(),
                        ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.green[900],
                          radius: 10,
                        ),
                        Text(
                          ' Proteins',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
