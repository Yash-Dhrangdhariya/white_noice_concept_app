import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_screen_store.g.dart';

class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  late final AnimationController musicAnimCtrl;
  late final AnimationController menuAnimCtrl;

  @observable
  int categoryIndex = 3;

  @observable
  int soundIndex = 0;

  @observable
  bool isMenuOpen = false;

  @observable
  bool isPlaying = false;

  // ignore: use_setters_to_change_properties
  void setCategory(int value) {
    categoryIndex = value;
  }

  // ignore: use_setters_to_change_properties
  void setSound(int value) {
    soundIndex = value;
  }

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
      duration: const Duration(
        milliseconds: 600,
      ),
    );
  }

  void initializeMenuAnimCtrl(TickerProvider vsync) {
    menuAnimCtrl = AnimationController(
      vsync: vsync,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
  }
}
