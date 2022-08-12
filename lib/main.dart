import 'dart:io';

import 'package:guess_number2/game.dart';

void main(){
  List<int> gameCount = [];
  while(true){
    play(gameCount);
    bool wantToplay = true;
    String? playAgain = 'x';
    while(playAgain!='y'&&playAgain!='Y'&&playAgain!='n'&&playAgain!='N') {
      print('Play agian(ํY/N)?');
      playAgain = stdin.readLineSync();
      if (playAgain == 'n' || playAgain == 'N') wantToplay = false;
    }
    if(!wantToplay) break;
  }
  print('\nYou\'ve played ${gameCount.length} games');
  for (var i = 0; i < gameCount.length; i++) {
    print('🚀 Game #${i+1}: ${gameCount[i]} guesses');
  }
}

void play(gameCount){
  stdout.write('Enter a maximum number to random: ');
  String? maxStr = stdin.readLineSync();
  var max = int.tryParse(maxStr!);
  print('════════════════════════════════════════════════════');
  print('GUESS THE NUMBER');
  var result = 0;
  Game game;
  if(max==null) game = Game();
  else game = Game(maxRandom: max);
  while(result==0){
    stdout.write('Please guess the number between 1 and  ${game.max}: ');
    String? input = stdin.readLineSync();
    var yourAns = int.tryParse(input!);
    if(yourAns==null){
      //print("Please type number only.");
      continue;
    }
    if(yourAns<1||yourAns>game.max){
      print("Please guess the number between 1 and ${game.max} only.");
      continue;
    }
    result = game.doGuess(yourAns);
  }
  gameCount.add(result);
  print('THE END');
  print('════════════════════════════════════════════════════');
}

