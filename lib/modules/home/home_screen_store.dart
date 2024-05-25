import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../constants/app_data.dart';
import '../../models/category_model.dart';
import '../../models/sound_model.dart';

part 'home_screen_store.g.dart';

class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  late final AnimationController musicAnimCtrl;
  late final AnimationController menuAnimCtrl;

  @observable
  CategoryModel activeCategory = AppData.categories.first;

  @observable
  SoundModel activeMusic = AppData.sounds.first;

  @observable
  bool isMenuOpen = false;

  @observable
  bool isPlaying = false;

  void openMenu() {
    isMenuOpen = true;
    menuAnimCtrl.forward();
  }

  void closeMenu() {
    isMenuOpen = false;
    menuAnimCtrl.reverse();
  }

  void pause() {
    isPlaying = false;
    musicAnimCtrl.reverse();
  }

  void play() {
    isPlaying = true;
    musicAnimCtrl.forward();
  }

  void initializeMusicAnimCtrl(TickerProvider vsync) {
    musicAnimCtrl = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 600),
    );
  }

  void initializeMenuAnimCtrl(TickerProvider vsync) {
    menuAnimCtrl = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 400),
    );
  }
}
