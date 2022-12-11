import 'package:fitwell/Random%20or%20Daywise%20Mode/mode.dart';
import 'package:fitwell/exercises/allExercises.dart';
import 'package:flutter/material.dart';

import 'exercise_card.dart';

class Home extends StatelessWidget {
  _gotToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return modeSelection();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7f78d2),
        title: Text("LCO Home Workout"),
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
              itemCount: AllExercises.length,
              itemBuilder: (BuildContext context, int index) {
                var exercise = AllExercises[index];
                return new ExerciseCard(exercise);
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    _gotToNextScreen(context);
                  },

                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
//          elevation: 5,
                  child: Container(
//            alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(13.0),
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
