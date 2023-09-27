import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_noice_concept_app/constants/app_data.dart';
import 'package:white_noice_concept_app/modules/home/home_screen_store.dart';
import 'package:white_noice_concept_app/resources/vectors.dart';
import 'package:white_noice_concept_app/values/app_colors.dart';

class ActiveAlbum extends StatelessObserverWidget {
  const ActiveAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    if (Modular.get<HomeScreenStore>().isMenuOpen) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Observer(
              builder: (context) {
                final index = Modular.get<HomeScreenStore>().categoryIndex;
                return Text(
                  '${AppData.categories[index].name} collection',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Observer(
                    builder: (context) {
                      final categoryIndex =
                          Modular.get<HomeScreenStore>().categoryIndex;
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(22),
                          image: DecorationImage(
                            image: NetworkImage(
                              AppData.categories[categoryIndex].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(10, 10),
                              spreadRadius: -16,
                              blurRadius: 40,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 80, 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '0${AppData.categories[categoryIndex].id}',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    AppData.categories[categoryIndex].desc,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: MediaQuery.sizeOf(context).width * 0.37,
                  top: 46,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(10, 20),
                            spreadRadius: -35,
                            blurRadius: 30,
                          ),
                        ],
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          Vectors.forest,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
