import 'package:flutter/material.dart';
import 'package:fitwell/exercise_class/exercise_classcreator.dart';

class ExerciseCard extends StatelessWidget {
  ExerciseCard(this.exercise);

  final Exercise exercise;

  BoxDecoration _createBox() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),

        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black26, spreadRadius: 2.0, blurRadius: 100.0)
        ]);
  }
  Widget _createThumbnail(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),

      child: Container(
        width: 170.0,
        height: 170.0,
        child: Image.asset(exercise.photo),
      ),
    );
  }
  Widget _exerciseDescription() {
    return new Padding(padding: EdgeInsets.only(top:16.0,left: 4.0,right: 4.0 ),
      child: Text(exercise.name,style: TextStyle(color: Colors.deepOrange.withOpacity(0.85)
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
      child:Container(
//      width: 175.0,
        padding: EdgeInsets.all(20.0),
        decoration: _createBox(),
        child: new Column(
        children: <Widget>[
          _createThumbnail(),
          _exerciseDescription(),
//          Flexible(flex:3, child: _createThumbnail()),
//          Flexible(flex: 1,child:  _exerciseDescription())

        ],

      ),
    ));
  }


}
