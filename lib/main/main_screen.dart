import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:hourouf_fighter/common/background.dart';
import 'package:hourouf_fighter/game_manager.dart';
import 'package:flutter/material.dart' show TextStyle, Colors;
import 'text.dart';

class MainScreen extends Component with HasGameRef<GameManager>, Tappable {
  //_onStartClicked : c'est un genre de pointeur de fonction qui pointe pas encore ?
  //final Function _onStartClicked;
  late TextComponent _playerScore;

  //on "surcharge" l'instance actuelle avec le pointeur de fonction _onStartClick ?
  MainScreen() {
    print("Hello");
  }

  @override
  Future<void>? onLoad() async {
    add(Background(40));
    add(Text());

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
    print("Hello World");
    //si l'instance mainscreen a bien été "montée" ou "ajoutée"...
    if (isMounted) {
      //...on lance la méthode _onStartClick qui n'a jamais contenu aucune instruction !
      //_onStartClicked();
      return true;
    }
    return false;
  }

  void setScore(int score) {
    _playerScore.text = "Score : $score";
  }
}
