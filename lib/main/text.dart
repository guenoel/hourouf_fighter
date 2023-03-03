import 'package:flame/components.dart';
import 'package:letter_fighter/game_manager.dart';
import 'package:flutter/material.dart' show Colors, FontWeight, TextStyle;

class TextFlag extends TextComponent with HasGameRef<GameManager> {
  late int id;
  late String textAlphabet;

  TextFlag(this.id, this.textAlphabet) : super() {
    //debugMode = true;
  }

  @override
  Future<void>? onLoad() async {
    text = textAlphabet;
    textRenderer = TextPaint(
        style: const TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ));

    size = Vector2(
        gameRef.size.toRect().width / 10, gameRef.size.toRect().width / 20);
    if (id < 4) {
      position = Vector2((gameRef.size.toRect().width * id) / 6,
          gameRef.size.toRect().height / 3 + gameRef.size.toRect().width / 20);
    } else {
      position = Vector2(
          (gameRef.size.toRect().width * (id - 3)) / 6,
          (gameRef.size.toRect().height / 3) * 2 +
              gameRef.size.toRect().width / 20);
    }
    anchor = Anchor.center;
  }
}
