import 'package:flutter/material.dart';

import '../game.dart';
import '../utils/audio_manager.dart';
import 'main_menu.dart';

class Settings extends StatelessWidget {
  static const id = 'Settings';
  final SimplePlatformer game;

  const Settings({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ValueListenableBuilder<bool>(
                valueListenable: AudioManager.sfx,
                builder: (context, sfx, child) => SwitchListTile(
                  title: const Text('Sound Effects'),
                  value: sfx,
                  onChanged: (value) => AudioManager.sfx.value = value,
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: ValueListenableBuilder<bool>(
                valueListenable: AudioManager.bgm,
                builder: (context, bgm, child) => SwitchListTile(
                  title: const Text('Background Music'),
                  value: bgm,
                  onChanged: (value) => AudioManager.bgm.value = value,
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  game.overlays.remove(id);
                  game.overlays.add(MainMenu.id);
                },
                child: const Text('Back'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
