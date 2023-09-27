import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_noice_concept_app/models/sound_model.dart';
import 'package:white_noice_concept_app/modules/home/home_screen_store.dart';
import 'package:white_noice_concept_app/resources/vectors.dart';
import 'package:white_noice_concept_app/values/app_colors.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({
    required this.sound,
    required this.index,
    required this.onTap,
    super.key,
  });

  final SoundModel sound;
  final VoidCallback onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black26,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 30,
                        spreadRadius: -10,
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(
                        sound.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Observer(
                    builder: (context) {
                      final isActive =
                          index == Modular.get<HomeScreenStore>().soundIndex;
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
                builder: (context) {
                  if (Modular.get<HomeScreenStore>().isMenuOpen) {
                    return const SizedBox();
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                      ),
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
                          const SizedBox(
                            height: 2,
                          ),
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
