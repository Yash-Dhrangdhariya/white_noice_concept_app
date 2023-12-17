import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants/app_data.dart';
import '../../../resources/images.dart';
import '../../../resources/vectors.dart';
import '../../../values/app_colors.dart';
import '../../../widgets/rounded_button.dart';
import '../home_screen_store.dart';
import '../widgets/category_tile.dart';

class CategoryBar extends StatefulObserverWidget {
  const CategoryBar({super.key});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _rotateAnimation;

  final _store = Modular.get<HomeScreenStore>();

  @override
  void initState() {
    _store.initializeMenuAnimCtrl(this);

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: 0.12,
    ).animate(
      CurvedAnimation(
        parent: _store.menuAnimCtrl,
        curve: Curves.easeIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _store.menuAnimCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: _store.isMenuOpen ? 3 : 1,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: RotationTransition(
                  turns: _rotateAnimation,
                  child: RoundedButton(
                    icon: Vectors.menu,
                    size: 40,
                    onTap: () {
                      if (_store.isMenuOpen) {
                        _store.closeMenu();
                      } else {
                        _store.openMenu();
                      }
                    },
                    padding: false,
                    bgColor: Colors.transparent,
                    fgColor: AppColors.grey,
                  ),
                ),
              ),
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: _store.isMenuOpen ? 4 : 3,
                child: Align(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    scrollDirection:
                        _store.isMenuOpen ? Axis.vertical : Axis.horizontal,
                    itemCount: AppData.categories.length,
                    itemBuilder: (_, index) => Align(
                      child: InkWell(
                        onTap: () => _store.setCategory(index),
                        overlayColor: const MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 400),
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Observer(
                                    builder: (context) {
                                      final isActive =
                                          _store.categoryIndex == index;
                                      if (isActive) {
                                        return const Padding(
                                          padding: EdgeInsets.only(right: 12),
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
                                    AppData.categories[index].name
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              if (_store.isMenuOpen) CategoryTile(index: index),
                            ],
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (_, __) => SizedBox(
                      width: _store.isMenuOpen
                          ? null
                          : MediaQuery.sizeOf(context).height * 0.08,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              backgroundImage: NetworkImage(Images.person1),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
