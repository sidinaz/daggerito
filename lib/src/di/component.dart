import 'package:daggerito/src/dependency_container.dart';


abstract class Component {
  DependencyContainer container();
}

abstract class Module {
  void register(DependencyContainer container);
}

abstract class ChildComponent implements Component {
  final DependencyContainer _container;

  ChildComponent(
    Component parentComponent, {
    Module module,
  }) : _container = DependencyContainer()
          ..collaborate(
            [parentComponent.container()],
          ) {
    if (module != null) module.register(_container);
  }

  @override
  DependencyContainer container() => _container;
}
