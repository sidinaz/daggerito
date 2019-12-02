import 'package:daggerito/daggerito.dart';

import 'models.dart';

class AModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => A1());
    container.register(($) => A2());
  }
}

class BModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => B1($()));
    container.register(($) => B2());
  }
}

class CModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => C1($()));
    container.register(($) => C2());
  }
}

class DModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => D1());
    container.register(($) => D2());
  }
}

class EModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => E1($(), $()));
    container.register(($) => E2());
  }
}

class FModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => F1(description: "model with tag t1"), tag: "t1");
    container.register(($) => F1(description: "model with tag t2"), tag: "t2");
  }
}

class GModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => G1());
    container.register(($) => G2());
  }
}

class HModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => H1($(), $(), $(), $("t1"), $("t2"), $(), $()));
    container.register(($) => H2());
  }
}

class IModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => I1());
    container.register(($) => I2($()));
  }
}
