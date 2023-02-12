import 'package:flame/components.dart';
import 'package:hourouf_fighter/game_manager.dart';

class TextStart extends SpriteComponent with HasGameRef<GameManager> {
  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load("start.png");
    anchor = Anchor.center;
    position = gameRef.size / 2;

    var originalSize = sprite?.originalSize;
    if (originalSize == null) return;
    var width = gameRef.size.toSize().width / 2;
    var height =
        originalSize.toSize().height * (width / originalSize.toSize().width);
    size = Vector2(width, height);
  }
}
