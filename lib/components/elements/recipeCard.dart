import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

class RecipeCard extends StatelessWidget {
  final Map recipe;
  final Function selectHandler;

  RecipeCard({this.recipe, this.selectHandler});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Card(
        elevation: 0.1,
        color: Color.fromRGBO(240, 255, 251, 1),
        child: InkWell(
          splashColor: Color.fromRGBO(16, 172, 132, 0.3),
          highlightColor: Color.fromRGBO(16, 172, 132, 0.1),
          onTap: () => selectHandler(context, recipe),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            recipe['label'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('by ${recipe['source']}'),
                        ),
                        Row(
                          children: [
                            Text(
                              recipe['calories'].round().toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(' Calories · '),
                            Text(
                              recipe['ingredients'].length.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              ' Ingredients',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Opacity(
                        opacity: 0.9,
                        child: Stack(
                          children: <Widget>[
                            Center(child: CircularProgressIndicator()),
                            Center(
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                fadeInDuration:
                                    const Duration(milliseconds: 300),
                                image: recipe['image'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
