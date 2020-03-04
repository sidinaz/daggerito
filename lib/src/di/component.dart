import 'package:daggerito/daggerito.dart';

import '../dependency_container.dart';

class Component {
  final DependencyContainer container;

  Component({
    List<Module> modules = const [],
    bool silent,
    DependencyContainer container,
  }) : this.container = container ??
            DependencyContainer(
              silent: silent,
            ) {
    modules.forEach(
      (module) => module.register(this.container),
    );
  }

  T call<T>([String tag]) => container.resolve<T>(tag);
}
