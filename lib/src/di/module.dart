import '../dependency_container.dart';

abstract class Module {
  void register(DependencyContainer container);
}
