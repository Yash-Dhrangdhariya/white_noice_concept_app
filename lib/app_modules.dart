import 'package:flutter_modular/flutter_modular.dart';
import 'package:white_noice_concept_app/modules/home/home_module.dart';

class AppModules extends Module {
  @override
  void routes(RouteManager r) {
    r.module(
      Modular.initialRoute,
      module: HomeModule(),
    );
  }
}
