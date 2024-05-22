import 'dart:js';

import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameflappybird/screens/gameover.dart';
import 'package:gameflappybird/screens/main_menu.dart';

import 'game/flappybirdgame.dart';

void main() {
  final game =  FlappyBirdGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const[MainMenu.id],
      overlayBuilderMap: {
        'MainMenu': (context, _) => MainMenu(game: game),
        'GameOver': (context, _) => GameOver(game: game),
      },
    )
  );

}



