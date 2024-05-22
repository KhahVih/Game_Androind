
import 'package:flutter/material.dart';
import 'package:gameflappybird/game/assets.dart';
import 'package:gameflappybird/game/flappybirdgame.dart';

class MainMenu extends StatelessWidget{
  final FlappyBirdGame game;
  static const String id='MainMenu';

  const MainMenu({Key? key, required this.game}): super(key: key);

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          game.overlays.remove('MainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.menu),
                fit: BoxFit.cover,
              )
          ),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }

}