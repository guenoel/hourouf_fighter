import 'package:flame/components.dart';
import 'package:letter_fighter/game_manager.dart';

class Life extends SpriteComponent with HasGameRef<GameManager> {
  late int life;
  late final SpriteComponent dragonball;

  Life(this.life);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('Dragon_Ball.png');
    size = Vector2.all(gameRef.size.toRect().width / 25);
    position = Vector2(
        gameRef.size.toRect().width -
            (life + 1) * size.x -
            gameRef.size.toRect().width / 40,
        gameRef.size.toRect().height * 0.01);
  }
}
