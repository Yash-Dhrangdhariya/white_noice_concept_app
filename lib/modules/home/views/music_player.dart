import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:white_noice_concept_app/modules/home/home_screen_store.dart';
import 'package:white_noice_concept_app/resources/vectors.dart';
import 'package:white_noice_concept_app/widgets/rounded_button.dart';

class MusicPlayer extends StatefulObserverWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _iconAnimation;

  final _store = Modular.get<HomeScreenStore>();

  @override
  void initState() {
    super.initState();
    _store.initializeMusicAnimCtrl(this);
    _iconAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      _store.musicAnimCtrl,
    );
  }

  @override
  void dispose() {
    _store.menuAnimCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: _store.isMenuOpen ? 3 : 0,
      child: SizedBox(
        height: 70,
        width: 300,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (_store.isPlaying) {
                      _store.pause();
                    } else {
                      _store.play();
                    }
                  },
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
                const SizedBox(
                  width: 10,
                ),
                RoundedButton(
                  onTap: () {},
                  icon: Vectors.waves,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                RoundedButton(
                  onTap: () {},
                  icon: Vectors.shuffle,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
