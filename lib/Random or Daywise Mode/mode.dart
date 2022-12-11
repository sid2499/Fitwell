import 'package:fitwell/exercise_class/exercise_classcreator.dart';
import 'package:fitwell/exercises/allExercises.dart';
import 'package:fitwell/ui/daywise_ui.dart';
import 'package:fitwell/ui/random_ui.dart';
import 'package:flutter/material.dart';
import 'dart:math';
Random rnd;

// ignore: camel_case_types
class modeSelection extends StatelessWidget {
//  int t=rnd.nextInt(10);
  // ignore: non_constant_identifier_names
  _goto_daywiseUi(BuildContext context) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return daywiseUi();
    }));
  }
  _goto_randomUi(BuildContext context) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return randomUi();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7f78d2),
          centerTitle: true,
          leading: Image.asset(
              'assets/images/LCO WORKOUT LOGO transparent copy.png'),
          title: Text("Mode Selection"),
        ),
        body: Stack(children: <Widget>[
          Center(
            child: Image.asset(
              'assets/images/javier-santos-guzman-9MR78HGoflw-unsplash.jpg',
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top:225.0),
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      _goto_daywiseUi(context);
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF7f78d2),
                            Color(0xFFefb1ff),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.only(
                          left: 40.0, top: 10.0, right: 40.0, bottom: 10.0),
                      child: const Text('Day Wise', style: TextStyle(fontSize: 30)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70.0),
                  ),
                  RaisedButton(
                    onPressed: () {


                      _goto_randomUi(context);
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF7f78d2),
                            Color(0xFFefb1ff),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.only(
                          left: 43.0, top: 10.0, right: 43.0, bottom: 10.0),
                      child: const Text('Random', style: TextStyle(fontSize: 30)),
                    ),
                  )
                ],
              ),
            ),
          )

        ]));
  }
}
