import 'package:flame/components.dart';
import 'package:letter_fighter/game_manager.dart';

class BackgroundIntro extends SpriteComponent with HasGameRef<GameManager> {
  BackgroundIntro();

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('wallpaper_dbz.png');
    //size = Vector2(GameManager.screenHeight * 1.66, GameManager.screenHeight);
    size = Vector2(GameManager.screenWidth, GameManager.screenHeight);
    position =
        Vector2(GameManager.screenWidth / 2, GameManager.screenHeight / 2);

    anchor = Anchor.center;
    //return super.onLoad();
  }
}
