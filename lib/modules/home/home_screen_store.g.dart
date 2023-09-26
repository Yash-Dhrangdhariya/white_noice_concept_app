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

  @override
  String toString() {
    return '''
categoryIndex: ${categoryIndex}
    ''';
  }
}
