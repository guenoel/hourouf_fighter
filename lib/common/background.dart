import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:letter_fighter/common/star.dart';
import 'package:letter_fighter/game_manager.dart';

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

class ImageBackground extends SpriteComponent with HasGameRef<GameManager> {
  int backgroundId;
  late String background;
  List<String> backgroundList = [
    'DBZTournament.png',
    'DBZTournamentSunset.png',
    'DBZPlains.png',
    'sfz2-vega-animated.gif'
  ];

  ImageBackground(this.backgroundId);

  @override
  Future<void>? onLoad() async {
    size = Vector2(GameManager.screenHeight * 3.7, GameManager.screenHeight);
    position = Vector2(-((size.x / 2) - (GameManager.screenWidth / 2)), 0);
    // if (backgroundId > backgroundList.length - 1) {
    //   backgroundId = backgroundList.length - 1;
    // }
    background = backgroundList[backgroundId];
    sprite = await gameRef.loadSprite(background);
    return super.onLoad();
  }

  List<String> get bgList {
    return backgroundList;
  }

  // @override
  // void render(Canvas canvas) {
  //   ImageBackground
  //   super.render(canvas);
  // }
}
