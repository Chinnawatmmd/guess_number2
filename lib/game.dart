import 'dart:math';

class Game{
  int answer = 0;
  int count = 0;
  int max = 0;
  Game({int maxRandom = 100}){
    max = maxRandom;
    var r = Random();
    answer = r.nextInt(maxRandom)+1;
  }

  int doGuess(int num){
    count++;
    if(num>answer){
      print('➜ $num is too high! ▲ ');
      return 0;
    }
    else if(num<answer){
      print('➜ $num is too low! ▼');
      return 0;
    }
    else{
      print('➜ $num is correct ❤ , total guesses: $count');
      return count;
    }
  }
}