import 'dependency_container.dart';
import 'definition.dart';

extension DependencyContainerExtensions on DependencyContainer{
  /// Attemps to resolve the type [T].
  ///
  /// If [tag] is set, the instance or builder registered with this
  /// name will be get.
  ///
  /// See also:
  ///
  ///  * [DependencyContainer.registerFactory] for register a builder function.
  ///  * [DependencyContainer.registerInstance] for register an instance.
  T resolve<T>([String tag]) => _resolve([this,...this.collaborators],tag);

  T _resolve<T>(List<DependencyContainer> containers ,[String tag]) {
    if(containers.length == 0)
      return null;

    T value;

    containers.forEach((dc){
      Map<Type, Definition<Object>> providers = dc.namedProviders[tag];

      if(providers != null && value == null){
        value = providers[T]?.get(this);
      }
      if(value == null){
        value = _resolve(dc.collaborators, tag);
      }
    });
    return value;

  }

  T call<T>([String tag]) => resolve<T>(tag);
}