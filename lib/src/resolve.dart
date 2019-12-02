import 'definition.dart';
import 'dependency_container.dart';

extension ResolveDependencyContainerExtensions on DependencyContainer {
  T resolve<T>([String tag]) => _resolve([this, ...this.collaborators], tag);

  T _resolve<T>(List<DependencyContainer> containers, [String tag]) {
    if (containers.length == 0) return null;

    T value;

    containers.forEach((dc) {
      Map<Type, Definition<Object>> providers = dc.namedProviders[tag];

      if (providers != null && value == null) {
        value = providers[T]?.get(this);
      }
      if (value == null) {
        value = _resolve(dc.collaborators, tag);
      }
    });
    return value;
  }

  T call<T>([String tag]) => resolve<T>(tag);
}
