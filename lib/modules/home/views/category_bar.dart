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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: RotationTransition(
                  turns: _rotateAnimation,
                  child: RoundedButton(
                    icon: Vectors.menu,
                    size: 40,
                    onTap:
                        _store.isMenuOpen ? _store.closeMenu : _store.openMenu,
                    padding: EdgeInsets.zero,
                    bgColor: Colors.transparent,
                    fgColor: AppColors.grey,
                  ),
                ),
              ),
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: _store.isMenuOpen ? 4 : 3,
                child: ListView.separated(
                  shrinkWrap: !_store.isMenuOpen,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  scrollDirection:
                      _store.isMenuOpen ? Axis.vertical : Axis.horizontal,
                  itemCount: AppData.categories.length,
                  itemBuilder: (_, index) {
                    final category = AppData.categories[index];
                    return GestureDetector(
                      onTap: () => _store.activeCategory = category,
                      child: Observer(
                        builder: (_) => CategoryTile(
                          category: category,
                          isActive: _store.activeCategory.id == category.id,
                          showDetailView: _store.isMenuOpen,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                    width: _store.isMenuOpen
                        ? null
                        : MediaQuery.sizeOf(context).height * 0.08,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    Images.person1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
