import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sprintf/sprintf.dart';

import '../../../constants/app_data.dart';
import '../../../values/app_constants.dart';
import '../../../values/app_themes.dart';
import '../../../values/string_placeholders.dart';
import '../home_screen_store.dart';
import '../widgets/album_tile.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/music_tile.dart';
import 'music_player.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<HomeScreenStore>();
    return Observer(
      builder: (_) => Flexible(
        flex: store.isMenuOpen ? 2 : 4,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Observer(
                builder: (_) => HomeAppBar(
                  state: store.isMenuOpen
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
              Observer(
                builder: (_) => Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: AnimatedSize(
                    alignment: Alignment.topCenter,
                    duration: AppConstants.defaultDuration,
                    child: store.isMenuOpen
                        ? const SizedBox.shrink()
                        : Text(
                            sprintf(StringPlaceholders.double, [
                              store.activeCategory.name,
                              'collection',
                            ]),
                            style: AppThemes.titleMedium,
                          ),
                  ),
                ),
              ),
              Observer(
                builder: (_) => store.isMenuOpen
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Observer(
                          builder: (_) => AlbumTile(
                            category: store.activeCategory,
                          ),
                        ),
                      ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: AppData.sounds.length,
                  padding: const EdgeInsets.all(10),
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemBuilder: (_, index) {
                    final music = AppData.sounds[index];
                    return Observer(
                      builder: (_) => MusicTile(
                        sound: music,
                        onTap: () => store.activeMusic = music,
                        showDetails: !store.isMenuOpen,
                        isPlaying: music.id == store.activeMusic.id,
                      ),
                    );
                  },
                ),
              ),
              const MusicPlayer(),
            ],
          ),
        ),
      ),
    );
  }
}
