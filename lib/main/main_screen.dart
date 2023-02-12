import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:hourouf_fighter/common/background.dart';
import 'package:hourouf_fighter/game_manager.dart';
import 'package:flutter/material.dart' show TextStyle, Colors;
import 'text.dart';

class MainScreen extends Component with HasGameRef<GameManager>, Tappable {
  late TextComponent _playerScore;
  MainScreen() {}

  @override
  Future<void>? onLoad() {
    add(Background(40));
    add(TextStart());

    _playerScore = TextComponent(
        text: "Score : 0",
        position: Vector2(gameRef.size.toRect().width / 2, 10),
        anchor: Anchor.topCenter,
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 48.0,
            color: Colors.white,
          ),
        ));

    add(_playerScore);
  }

  @override
  bool onTapDown(TapDownInfo info) {
    if (isMounted) {
      return true;
    }
    return false;
  }

  void setScore(int score) {
    _playerScore.text = "Score : $score";
  }
}
