import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:white_noice_concept_app/constants/app_data.dart';
import 'package:white_noice_concept_app/modules/home/home_screen_store.dart';
import 'package:white_noice_concept_app/resources/images.dart';

class CategoryBar extends StatelessWidget {
  CategoryBar({super.key});

  final _store = Modular.get<HomeScreenStore>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: 3,
                child: Align(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: AppData.categories.length,
                    itemBuilder: (context, index) => Align(
                      child: InkWell(
                        onTap: () => _store.changeCategory(index),
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 400),
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              Observer(
                                builder: (context) {
                                  final isActive =
                                      _store.categoryIndex == index;
                                  if (isActive) {
                                    return const Padding(
                                      padding: EdgeInsets.only(
                                        right: 12,
                                      ),
                                      child: CircleAvatar(
                                        radius: 4,
                                        backgroundColor: Colors.blue,
                                      ),
                                    );
                                  }
                                  return const SizedBox();
                                },
                              ),
                              Text(
                                AppData.categories[index],
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (_, __) => SizedBox(
                      width: MediaQuery.sizeOf(context).height * 0.08,
                    ),
                  ),
                ),
                // child: Row(
                //   children: List.generate(
                //     AppData.categories.length,
                //     (index) => Text(
                //       AppData.categories[index],
                //     ),
                //   ),
                // ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                Images.person1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
