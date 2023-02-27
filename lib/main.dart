import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Makes the game full screen and landscape only.
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(const LetterFighter());
}

class LetterFighter extends StatelessWidget {
  const LetterFighter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: "Letter Fighter",
      debugShowCheckedModeBanner: false,
      home: GameWidget(game: GameManager()),
    );
  }
}
