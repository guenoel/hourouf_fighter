import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:letter_fighter/common/background.dart';
import 'package:letter_fighter/game_manager.dart';
import 'package:flutter/material.dart' show TextStyle, Colors;
import 'text.dart';

class MainScreen extends Component with HasGameRef<GameManager>, Tappable {
  late TextComponent _levelScore;

  MainScreen();

  @override
  Future<void>? onLoad() {
    add(StarBackground(40));
    add(TextStart());
    //FlameAudio.bgm.stop();
    //FlameAudio.bgm.play('DragonBallArabicOpening.mp3');

    _levelScore = TextComponent(
        text: "Niveau : 0",
        position: Vector2(gameRef.size.toRect().width / 2, 10),
        anchor: Anchor.topCenter,
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 40.0,
            color: Colors.white,
          ),
        ));

    add(_levelScore);
  }

  @override
  bool onTapDown(TapDownInfo info) {
    if (isMounted) {
      return true;
    }
    return false;
  }

  void setScore(int levelScore) {
    _levelScore.text = "Level : $levelScore";
  }
}
