import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_generator/providers/modules/main.dart';

class Welcome extends StatelessWidget {
  Future<void> hideWelcome(BuildContext context) async {
    await Provider.of<MainState>(context, listen: false).hideWelcome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(240, 255, 251, 1),
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: SizedBox(
                height: 10,
              )),
              Image.asset(
                'lib/assets/fork.png',
                width: 40,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 280,
                child: Text(
                  'If you don’t know what to cook today, you are in the right place, just select the type of meal you’d like to have and we’ll show you a catalog of options to choose from.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 10,
                ),
              ),
              Image.asset(
                'lib/assets/meal.png',
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 250,
                height: 57,
                child: RaisedButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  onPressed: () {
                    hideWelcome(context);
                  },
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
