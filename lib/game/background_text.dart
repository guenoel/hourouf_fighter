import 'package:flame/components.dart';
import 'package:letter_fighter/game_manager.dart';

class BackgroundText extends SpriteComponent with HasGameRef<GameManager> {
  late int id;

  BackgroundText(this.id);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('bg_text.png');

    if (id == 1) {
      size = Vector2(236, 48);
      position = Vector2(gameRef.size.toRect().width * 0.03,
          gameRef.size.toRect().height * 0.01);
      //position = Vector2(gameRef.size.toRect().width * 0.12,
      //    gameRef.size.toRect().height * 0.01);
    }
    if (id == 2) {
      size = Vector2(190, 48);
      position = Vector2(gameRef.size.toRect().width * 0.59,
          gameRef.size.toRect().height * 0.01);
    }
  }
}
