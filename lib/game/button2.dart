import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:letter_fighter/game_manager.dart';

class Letter extends TextComponent with Tappable, HasGameRef<GameManager> {
  Letter();

  TextPaint dialogTextPaint =
      TextPaint(style: const TextStyle(fontSize: 36, color: Colors.white));

  @override
  Future<void>? onLoad() async {}
}
