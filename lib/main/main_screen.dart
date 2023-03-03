import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:letter_fighter/common/background.dart';
import 'package:letter_fighter/game_manager.dart';
import 'package:flutter/material.dart' show Colors, FontWeight, TextStyle;
import 'package:letter_fighter/main/background_intro.dart';
import 'package:letter_fighter/main/flag.dart';
import 'text.dart';

class MainScreen extends Component with HasGameRef<GameManager>, Tappable {
  late TextComponent _levelScore;

  MainScreen();

  @override
  Future<void>? onLoad() {
    //add(StarBackground(40));
    add(BackgroundIntro());
    for (int i = 1; i < 7; i++) {
      add(Flag(i));
    }
    add(TextFlag(1, 'French'));
    add(TextFlag(2, 'English'));
    add(TextFlag(3, 'Cyrilic'));
    add(TextFlag(4, 'Arabic'));
    add(TextFlag(5, 'Hebrew'));
    add(TextFlag(6, 'Amahric'));

    //add(TextStart());
    //FlameAudio.bgm.stop();
    //FlameAudio.bgm.play('DragonBallArabicOpening.mp3');

    _levelScore = TextBoxComponent(
        text: "Which Alphabet do you want to fight with ?",
        size: Vector2(gameRef.size.toRect().width * 0.42,
            gameRef.size.toRect().height / 5),
        position: Vector2(
            gameRef.size.toRect().width / 8, gameRef.size.toRect().height / 20),
        anchor: Anchor.topLeft,
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
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
