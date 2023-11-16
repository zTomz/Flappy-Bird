import 'package:flappy_bird/database/database.dart';
import 'package:flappy_bird/global/constant.dart';
import 'package:flutter/material.dart';

class MusicSettings extends StatefulWidget {
  const MusicSettings({Key? key}) : super(key: key);

  @override
  State<MusicSettings> createState() => _MusicSettingsState();
}

class _MusicSettingsState extends State<MusicSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              "Music",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () async {
                    Database.write(BoxId.audio, true);
                    await GameState.player.resume();
                  },
                  child: const Icon(
                    Icons.music_note_rounded,
                    size: 40,
                  )),
              GestureDetector(
                onTap: () async {
                  Database.write(BoxId.audio, false);
                  await GameState.player.pause();
                },
                child: const Icon(
                  Icons.music_off_rounded,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
