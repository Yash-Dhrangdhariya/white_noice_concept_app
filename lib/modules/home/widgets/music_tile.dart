import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/sound_model.dart';
import '../../../resources/vectors.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_constants.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({
    required this.sound,
    required this.onTap,
    this.isPlaying = false,
    this.showDetails = false,
    super.key,
  });

  final SoundModel sound;
  final VoidCallback onTap;
  final bool showDetails;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSize(
        alignment: Alignment.centerLeft,
        duration: AppConstants.defaultDuration,
        child: Row(
          mainAxisSize: showDetails ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment:
              showDetails ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(sound.image),
                  fit: BoxFit.cover,
                ),
                color: Colors.black26,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: isPlaying
                  ? Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
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
                    )
                  : null,
            ),
            if (showDetails)
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
              ),
          ],
        ),
      ),
    );
  }
}
