import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_data.dart';
import '../../../resources/vectors.dart';
import '../../../values/app_colors.dart';
import '../home_screen_store.dart';
import '../widgets/active_album.dart';
import '../widgets/music_tile.dart';
import 'music_player.dart';

class HomeBody extends StatelessObserverWidget {
  HomeBody({super.key});

  final HomeScreenStore _store = Modular.get<HomeScreenStore>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: _store.isMenuOpen ? 2 : 4,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Observer(
                    builder: (_) {
                      return _store.isMenuOpen
                          ? SvgPicture.asset(Vectors.forest, width: 30)
                          : const Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              child: Text(
                                'White noise',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey,
                                ),
                              ),
                            );
                    },
                  ),
                  ActiveAlbum(),
                  const SizedBox(height: 30),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: AppData.sounds.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => Observer(
                      builder: (_) => SizedBox(
                        height: _store.isMenuOpen ? 20 : 10,
                      ),
                    ),
                    itemBuilder: (_, index) => MusicTile(
                      sound: AppData.sounds[index],
                      index: index,
                      onTap: () => _store.setSound(index),
                    ),
                  ),
                ],
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: MusicPlayer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
