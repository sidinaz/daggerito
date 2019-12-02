import 'definition.dart';

class DependencyContainer {
  DependencyContainer()
      : namedProviders = Map<String, Map<Type, Definition<Object>>>();

  final Map<String, Map<Type, Definition<Object>>> namedProviders;

  bool silent = true;

  List<DependencyContainer> collaborators = [];

  void clear() {
    namedProviders.clear();
  }

  void setProvider<T>(String name, Definition<T> provider) {
    assert(
      silent ||
          (!namedProviders.containsKey(name) ||
              !namedProviders[name].containsKey(T)),
      assertRegisterMessage<T>('already', name),
    );

    namedProviders.putIfAbsent(name, () => Map<Type, Definition<Object>>())[T] =
        provider;
  }

  String assertRegisterMessage<T>(String word, String name) {
    return 'The type $T was $word registered${name == null ? '' : ' for the name $name'}';
  }

  void collaborate(List<DependencyContainer> containers) {
    this.collaborators = [...this.collaborators, ...containers];
  }

//  extension ResolveDependencyContainerExtensions on DependencyContainer {
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

//}
//  extension RegisterDependencyContainerExtensions on DependencyContainer {
  void registerInstance<S, T extends S>(
    S instance, {
    String tag,
  }) {
    setProvider(tag, Definition<S>.instance(instance));
  }

  void register<S, T extends S>(
    Factory<S> factory, {
    String tag,
  }) {
    setProvider(tag, Definition<S>.factory(factory));
  }

  void registerSingleton<S, T extends S>(
    Factory<S> factory, {
    String tag,
  }) {
    setProvider(tag, Definition<S>.singleton(factory));
  }

  void unregister<T>([String tag]) {
    assert(silent || (namedProviders[tag]?.containsKey(T) ?? false),
        assertRegisterMessage<T>('not', tag));
    namedProviders[tag]?.remove(T);
  }
//}
}
