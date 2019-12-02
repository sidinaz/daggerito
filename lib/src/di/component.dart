import 'package:daggerito/daggerito.dart';

import '../dependency_container.dart';

abstract class Component {
  final DependencyContainer container = DependencyContainer();

  Component({
    List<Module> modules = const [],
  }) {
    modules.forEach(
      (module) => module.register(container),
    );
  }

  T call<T>([String tag]) => container.resolve<T>(tag);
}
