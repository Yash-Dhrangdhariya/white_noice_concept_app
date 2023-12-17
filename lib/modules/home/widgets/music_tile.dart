import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_noice_concept_app/models/sound_model.dart';
import 'package:white_noice_concept_app/modules/home/home_screen_store.dart';
import 'package:white_noice_concept_app/resources/vectors.dart';
import 'package:white_noice_concept_app/values/app_colors.dart';

class MusicTile extends StatelessWidget {
  MusicTile({
    required this.sound,
    required this.index,
    required this.onTap,
    super.key,
  });

  final SoundModel sound;
  final VoidCallback onTap;
  final int index;

  final HomeScreenStore _store = Modular.get<HomeScreenStore>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                dimension: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.black26,
                    boxShadow: const [
                      BoxShadow(blurRadius: 30, spreadRadius: -10),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(sound.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Observer(
                    builder: (_) {
                      final isActive = index == _store.soundIndex;
                      if (isActive) {
                        return Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.7),
                            radius: 16,
                            child: SvgPicture.asset(
                              Vectors.waves,
                              width: 18,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
              Observer(
                builder: (_) {
                  return _store.isMenuOpen
                      ? const SizedBox.shrink()
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sound.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${sound.seconds}s',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
