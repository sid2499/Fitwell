import 'dart:math';

import 'package:fitwell/Exercise%20On/exercise_on_ui.dart';
import 'package:fitwell/exercise_class/exercise_classcreator.dart';
import 'package:fitwell/exercises/allExercises.dart';
import 'package:flutter/material.dart';
import 'exercise_card.dart';


// ignore: must_be_immutable, camel_case_types
class randomUi extends StatelessWidget {


List<Exercise> _ex=AllExercises.sublist(0,6);


  // ignore: non_constant_identifier_names
  _goto_exercise_on_ui(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(
        builder: (context)=>exerciseOn(exercise:_ex ))
//      return exerciseOn();
    );}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7f78d2),
        title: Text("Today's Exercises"),
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: null)],
        leading: IconButton(
          icon: Image.asset(
            'assets/images/LCO WORKOUT LOGO transparent copy.png',
            fit: BoxFit.cover,
            height: 65.0,
          ),
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: <Widget>[
          new Center(
            child: Image.asset(
              'assets/images/william-daigneault-EAf4AcPUlj0-unsplash.jpg',
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),
          ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                var exercise = _ex[index];
                return new ExerciseCard(exercise);
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    _goto_exercise_on_ui(context);
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
                    child: const Text('Start', style: TextStyle(fontSize: 30)),
                  ),
                )),
          )
        ],
      ),

    );
  }
}


