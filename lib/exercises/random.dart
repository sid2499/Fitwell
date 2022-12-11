import 'dart:math';
import 'package:fitwell/exercise_class/exercise_classcreator.dart';
import 'allExercises.dart';
import 'package:fitwell/Exercise On/exercise_on_ui.dart';


List<Exercise> rand(){
  List<int> a=[];
  List<Exercise> ex;
  for(int i=0;i<5;i++){
    Random rnd;
    while(true){
      int t=rnd.nextInt(10);
      if(!a.contains(t)){
        a.add(t);
        ex.add(AllExercises[t]);
        break;
      }
    }
  }
  ex.add(AllExercises[11]);
  return ex;
//  exerciseOn(exercise: ex);
}