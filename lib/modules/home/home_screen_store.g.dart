// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenStore on _HomeScreenStore, Store {
  late final _$categoryIndexAtom =
      Atom(name: '_HomeScreenStore.categoryIndex', context: context);

  @override
  int get categoryIndex {
    _$categoryIndexAtom.reportRead();
    return super.categoryIndex;
  }

  @override
  set categoryIndex(int value) {
    _$categoryIndexAtom.reportWrite(value, super.categoryIndex, () {
      super.categoryIndex = value;
    });
  }

  late final _$soundIndexAtom =
      Atom(name: '_HomeScreenStore.soundIndex', context: context);

  @override
  int get soundIndex {
    _$soundIndexAtom.reportRead();
    return super.soundIndex;
  }

  @override
  set soundIndex(int value) {
    _$soundIndexAtom.reportWrite(value, super.soundIndex, () {
      super.soundIndex = value;
    });
  }

  late final _$isMenuOpenAtom =
      Atom(name: '_HomeScreenStore.isMenuOpen', context: context);

  @override
  bool get isMenuOpen {
    _$isMenuOpenAtom.reportRead();
    return super.isMenuOpen;
  }

  @override
  set isMenuOpen(bool value) {
    _$isMenuOpenAtom.reportWrite(value, super.isMenuOpen, () {
      super.isMenuOpen = value;
    });
  }

  late final _$isPlayingAtom =
      Atom(name: '_HomeScreenStore.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  @override
  String toString() {
    return '''
categoryIndex: ${categoryIndex},
soundIndex: ${soundIndex},
isMenuOpen: ${isMenuOpen},
isPlaying: ${isPlaying}
    ''';
  }
}
