import 'package:fitwell/exercise_class/exercise_classcreator.dart';
import 'package:fitwell/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';

typedef void OnError(Exception exception);

// ignore: camel_case_types
class roundClock extends StatefulWidget {
  final List<Exercise> exercise;

  roundClock(this.exercise);

  @override
  _MyAppState createState() => _MyAppState(exercise);
}

class _MyAppState extends State<roundClock> with TickerProviderStateMixin {
  final List<Exercise> exercise;
  int _i = 0, c = 0, j = 0, f = 0;
  int time = 6;

  _MyAppState(this.exercise);

  AnimationController controller;
  Animation<double> animation;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

//  Audio player variables
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 6))
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed && c < 8 && f == 1) {
              _i = j;
              advancedPlayer.stop();
              controller.duration = Duration(seconds: 6);
              this.setState(() {
                ++_i;
              });
              audioCache.play(exercise[_i].music);
              j = _i;
              c++;
              f = 0;
              controller.reverse(
                  from: controller.value == 0.0 ? 1.0 : controller.value);
            } else if (status == AnimationStatus.dismissed && c < 8 && f == 0) {
              controller.duration = Duration(seconds: 3);
              advancedPlayer.stop();
              this.setState(() {
                _i = 5;
              });
              audioCache.play(exercise[_i].music);
              c++;
              f = 1;
              controller.reverse(
                  from: controller.value == 0.0 ? 1.0 : controller.value);
            } else if (AnimationStatus.dismissed == status && c > 7) {
              advancedPlayer.stop();
              _showAlert(context);
            }
          });
//    animation=new Tween(begin: 0.0,end: 5.0).animate(controller)
//    ..addStatusListener((status){
//      if(status==controller)
//    })
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
  }

  @override
  Widget build(BuildContext context) {
    FloatingActionButton button = FloatingActionButton(
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Icon(controller.isAnimating ? Icons.pause : Icons.play_arrow);
        },
      ),
      onPressed: () {
        if (controller.isAnimating) {
          controller.stop();
          advancedPlayer.pause();
        } else {
          controller.reverse(
              from: controller.value == 0.0 ? 1.0 : controller.value);
          audioCache.play(exercise[_i].music);
        }
      },
      hoverElevation: 20.0,
      splashColor: Colors.redAccent,
      focusColor: Colors.redAccent,
      hoverColor: Colors.greenAccent,
      backgroundColor: Color(0xFF7f78d2),
    );
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        Card(
            child: AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget child) {
                  return Column(
                    children: <Widget>[
                      Image.asset(
                        exercise[_i].photo,
                        height: 300,
                      ),
                      Center(
                        child: Text(
                          exercise[_i].name,
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                    ],
                  );
                })
//          Image.asset(exercise[_i].photo),
            ),
        Padding(
          padding: EdgeInsets.all(35.0),
        ),
        Container(
          width: 300,
          height: 200,
          child: Center(
            child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: AnimatedBuilder(
                                      animation: controller,
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return CustomPaint(
                                          painter: TimerPainter(
                                              animation: controller,
                                              backgroundColor:
                                                  Colors.lightGreen,
                                              color: Color(0xFF7f78d2)),
                                        );
                                      })),
                              Align(
                                alignment: FractionalOffset.center,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Count Down",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    AnimatedBuilder(
                                      animation: controller,
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return Text(
                                          timerString,
                                          style: TextStyle(fontSize: 25),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: (Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          button
//                              FloatingActionButton(
//
//
//                                child: AnimatedBuilder(
//                                  animation: controller,
//
//                                  builder:(BuildContext context,Widget child){
//                                    return Icon(controller.isAnimating ? Icons.pause : Icons.play_arrow);
//                                  } ,
//                                ),
//                                onPressed: (){
//                                  if(controller.isAnimating){
//                                    controller.stop();
//                                  advancedPlayer.pause();}
//
//                                  else{
//                                    controller.reverse(from: controller.value== 0.0?1.0:controller.value);
//                                    audioCache.play('Song 14 - Rock.mp3');
//
//                                  }
//                                },hoverElevation: 20.0,splashColor:Colors.redAccent,focusColor:Colors.redAccent ,hoverColor:Colors.greenAccent ,backgroundColor: Color(0xFF7f78d2),
//                              )
                        ],
                      )),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}

void _showAlert(BuildContext context) {
  var alert = AlertDialog(
    title: Text("Done For The Day ✔✔"),
    actions: <Widget>[
      RaisedButton(
        onPressed: () {
          _goto_beginning(context);
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
              left: 25.0, top: 10.0, right: 25.0, bottom: 10.0),
          child: const Text('Continue', style: TextStyle(fontSize: 18)),
        ),
      )
    ],
  );
  showDialog(context: context,child: alert);
}

 // ignore: non_constant_identifier_names
 _goto_beginning(BuildContext context) {
   Navigator.of(context)
       .push(new MaterialPageRoute(builder: (BuildContext context) {
     return Home();
   }));
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);
  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
        size.center(Offset.zero),
        size.width / 2.0,
//    25.0,
        paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    // TODO: implement shouldRepaint
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
