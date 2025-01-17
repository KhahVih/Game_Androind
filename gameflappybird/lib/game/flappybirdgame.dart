



import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';
import 'package:gameflappybird/components/background.dart';
import 'package:gameflappybird/components/config.dart';

import 'package:gameflappybird/components/ground.dart';
import 'package:gameflappybird/components/pepe_ground.dart';

import '../components/bird.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection{
  FlappyBirdGame();

  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
     // PipeGroup(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore(){
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
          style: const TextStyle(fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void onTap(){
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score.text = 'Score: ${bird.score}';
  }
}