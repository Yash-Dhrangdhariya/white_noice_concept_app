import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../resources/vectors.dart';
import '../../../widgets/rounded_button.dart';
import '../home_screen_store.dart';

class MusicPlayer extends StatefulObserverWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _iconAnimation =
      Tween<double>(begin: 0, end: 1).animate(
    _store.musicAnimCtrl,
  );

  final _store = Modular.get<HomeScreenStore>();

  @override
  void initState() {
    super.initState();
    _store.initializeMusicAnimCtrl(this);
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: _store.isMenuOpen ? 3 : 0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 70, maxWidth: 300),
        child: Row(
          children: [
            IconButton(
              onPressed: _store.isPlaying ? _store.pause : _store.play,
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
              ),
              icon: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _iconAnimation,
              ),
            ),
            Expanded(
              child: Slider(
                value: 0.5,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(width: 10),
            RoundedButton(
              icon: Vectors.waves,
              onTap: () {},
              size: 20,
            ),
            const SizedBox(width: 10),
            RoundedButton(
              icon: Vectors.shuffle,
              onTap: () {},
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _store.menuAnimCtrl.dispose();
    super.dispose();
  }
}
