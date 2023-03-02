import 'package:flame/components.dart';
import 'package:letter_fighter/game_manager.dart';

class Flag extends SpriteComponent with HasGameRef<GameManager> {
  late int id;

  Flag(this.id);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('flag$id.png');
    size = Vector2(
        gameRef.size.toRect().width / 10, gameRef.size.toRect().width / 20);
    if (id < 4) {
      position = Vector2((gameRef.size.toRect().width * id) / 6,
          gameRef.size.toRect().height / 3);
    } else {
      position = Vector2((gameRef.size.toRect().width * (id - 3)) / 6,
          (gameRef.size.toRect().height / 3) * 2);
    }
    anchor = Anchor.center;
  }
}
