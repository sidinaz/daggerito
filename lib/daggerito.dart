library daggerito;

import 'package:daggerito/src/container_configuration.dart';

export 'package:daggerito/src/dependency_container.dart';
export 'package:daggerito/src/definition.dart';
export 'package:daggerito/src/di/component.dart';
export 'package:daggerito/src/di/module.dart';
export 'package:daggerito/src/di/sub_component.dart';

class Daggerito {
  static configure({bool silent = false}) {
    ContainerConfiguration.silent = silent;
  }
}
