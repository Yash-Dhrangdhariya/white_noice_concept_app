import 'package:flutter_modular/flutter_modular.dart';
import 'package:white_noice_concept_app/modules/home/home_screen.dart';

import 'home_screen_store.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const HomeScreen());
  }

  @override
  void binds(Injector i) {
    i.addLazySingleton<HomeScreenStore>(HomeScreenStore.new);
  }
}
