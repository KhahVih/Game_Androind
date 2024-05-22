

import 'package:flutter/material.dart';
import 'package:gameflappybird/game/assets.dart';
import 'package:gameflappybird/game/flappybirdgame.dart';

class GameOver extends StatelessWidget{
    final FlappyBirdGame game;
    static const String id = 'GameOver';

    const GameOver({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.bird.score}',
              style: const TextStyle(
                fontSize: 60,
                color:  Colors.white,
                fontFamily: 'Game',
              ),
            ),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20),
                )
            )
          ],
        ),
      ),
    );
  }

  void onRestart(){
    game.bird.reset();
    game.overlays.remove('GameOver');
    game.resumeEngine();
  }
}