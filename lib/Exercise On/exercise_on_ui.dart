import 'dart:async';

import 'package:fitwell/exercise_class/exercise_classcreator.dart';
import 'package:fitwell/ui/clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



String _image='';
// ignore: camel_case_types
class exerciseOn extends StatefulWidget {
  final List<Exercise> exercise;

  exerciseOn({Key key, @required this.exercise}) : super(key: key);

  @override
  _exerciseOnState createState() => _exerciseOnState(exercise);
}

// ignore: camel_case_types
class _exerciseOnState extends State<exerciseOn> with TickerProviderStateMixin{
  final List<Exercise> exercise;

  _exerciseOnState(this.exercise);

  BoxDecoration _createBox() {
    return BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black38, spreadRadius: 12.0, blurRadius: 30.0)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF7f78d2),
            title: Text("Biswa Training Center"),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.menu), onPressed: null)
            ],
            leading: IconButton(
              icon: Image.asset(
                'assets/images/LCO WORKOUT LOGO transparent copy.png',
                fit: BoxFit.cover,
                height: 65.0,
              ),
              onPressed: () {},
            )),
        body: Column(children: <Widget>[
//          Padding(padding: EdgeInsets.all(30),),
//          Container(
//            margin: EdgeInsets.all(22.0),
//            height: 270.0,
//            width: 400.0,
//            decoration: _createBox(),
//            child: Column(
//              children: <Widget>[
//                Container(
//                  height:250.0,
//                  child: Image.asset(exercise[1].photo),
//                ),
//              ],
//            ),
//          ),

          Container(

            height:700.0,
            width: 450.0,
            decoration: _createBox(),
            margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 40),
            child: roundClock(exercise)
          ),
        ]));
  }
//  Widget _currentImage() {
//    for(int i=0;i<5;i++){
//      var _timer=Timer(Duration(seconds: 5),(){
//        setState(() {
//
//        });
//      });
//    }
//  }
}
