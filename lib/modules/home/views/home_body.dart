import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_noice_concept_app/constants/app_data.dart';
import 'package:white_noice_concept_app/modules/home/home_screen_store.dart';
import 'package:white_noice_concept_app/modules/home/views/music_player.dart';
import 'package:white_noice_concept_app/modules/home/widgets/active_album.dart';
import 'package:white_noice_concept_app/modules/home/widgets/music_tile.dart';
import 'package:white_noice_concept_app/resources/vectors.dart';
import 'package:white_noice_concept_app/values/app_colors.dart';

class HomeBody extends StatelessObserverWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: Modular.get<HomeScreenStore>().isMenuOpen ? 2 : 4,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 400,
        ),
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                children: [
                  Observer(
                    builder: (context) {
                      final isMenuOpen =
                          Modular.get<HomeScreenStore>().isMenuOpen;
                      if (isMenuOpen) {
                        return SvgPicture.asset(
                          Vectors.forest,
                          width: 30,
                        );
                      }
                      return const Padding(
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
                  const ActiveAlbum(),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => Observer(
                      builder: (_) {
                        if (Modular.get<HomeScreenStore>().isMenuOpen) {
                          return const SizedBox(
                            height: 20,
                          );
                        }
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => MusicTile(
                      sound: AppData.sounds[index],
                      index: index,
                      onTap: () => Modular.get<HomeScreenStore>().setSound(
                        index,
                      ),
                    ),
                    itemCount: AppData.sounds.length,
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
