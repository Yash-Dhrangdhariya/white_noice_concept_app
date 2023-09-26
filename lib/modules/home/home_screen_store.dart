import 'package:mobx/mobx.dart';

part 'home_screen_store.g.dart';

class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  @observable
  int categoryIndex = 3;

  // ignore: use_setters_to_change_properties
  void changeCategory(int value) {
    categoryIndex = value;
  }
}
