import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gameflappybird/components/config.dart';
import 'package:gameflappybird/components/pipe.dart';
import 'package:gameflappybird/game/assets.dart';
import 'package:gameflappybird/game/flappybirdgame.dart';
import 'package:gameflappybird/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame>{
  PipeGroup();
  final _random = Random();
  @override
  Future<void> onLoad() async{
    position.x = gameRef.size.x;
    final heightMinusGroup = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGroup / 4);
    final centerY = spacing + _random.nextDouble() * (heightMinusGroup - spacing);

    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(pipePosition: PipePosition.bottom, height: heightMinusGroup - (centerY + spacing / 2)),
    ]);
  }

  @override
  void update(double dt){
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if(position.x < -10){
      removeFromParent();
      updateScore();
    }

    if(gameRef.isHit){
      removeFromParent();
      gameRef.isHit = false;
    }
  }
  void updateScore(){
    gameRef.bird.score += 1;
    FlameAudio.play(Assets.point);
  }
}