import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:gameflappybird/game/assets.dart';
import 'package:gameflappybird/game/flappybirdgame.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame>{
  Background();
  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}