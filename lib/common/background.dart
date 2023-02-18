import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hourouf_fighter/common/star.dart';
import 'package:hourouf_fighter/game_manager.dart';

class StarBackground extends Component with HasGameRef<GameManager> {
  int nbStars;

  StarBackground(this.nbStars);

  @override
  Future<void>? onLoad() {
    for (int i = 0; i < nbStars; i++) {
      add(Star());
    }
  }
}

class WhiteBackground extends PositionComponent {
  Color baseBackgroundColor = Color.fromARGB(255, 255, 255, 255);
  @override
  void render(Canvas canvas) {
    canvas.drawColor(baseBackgroundColor, BlendMode.src);
  }
}

class ImageBackground extends SpriteComponent with HasGameRef<GameManager> {
  @override
  Future<void>? onLoad() async {
    size = Vector2(GameManager.screenHeight * 3.7, GameManager.screenHeight);
    //position =
    //    Vector2(-GameManager.screenWidth / 2, -GameManager.screenHeight * 1.22);
    position = Vector2(-((size.x / 2) - (GameManager.screenWidth / 2)), 0);
    sprite = await gameRef.loadSprite('DBZTournament.png');
    return super.onLoad();
  }
}
