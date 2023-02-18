import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:hourouf_fighter/game_manager.dart';

class Life extends SpriteComponent with HasGameRef<GameManager> {
  late int life;
  late final SpriteComponent dragonball;

  Life(this.life);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('Dragon_Ball.png');
    size = Vector2.all(48);
    position = Vector2((GameManager.screenWidth - (life + 1) * size.x), 0);
  }
}
