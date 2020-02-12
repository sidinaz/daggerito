import 'package:daggerito/daggerito.dart';

import '../dependency_container.dart';

abstract class Component {
  final DependencyContainer container;

  Component({
    List<Module> modules = const [],
    bool silent,
  }) : this.container = DependencyContainer(
          silent: silent,
        ) {
    modules.forEach(
      (module) => module.register(container),
    );
  }

  T call<T>([String tag]) => container.resolve<T>(tag);
}
