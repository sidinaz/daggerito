import 'definition.dart';

class DependencyContainer {
  DependencyContainer()
      : definitions = Map<String, Map<Type, Definition<Object>>>();

  final Map<String, Map<Type, Definition<Object>>> definitions;

  /// Whether ignoring assertion errors in the following cases:
  /// * if you register the same type under the same tag a second time.
  /// * if you try to resolve or unregister a type that was not
  /// previously registered.
  ///
  /// Defaults to true.
  bool silent = true;

  List<DependencyContainer> collaborators = [];

  void clear() {
    definitions.clear();
  }

  /// Use a tag in case you need to register multiple factories fo the same type, to differentiate them.
  void setProvider<T>(String tag, Definition<T> provider) {
    assert(
      silent ||
          (!definitions.containsKey(tag) || !definitions[tag].containsKey(T)),
      assertRegisterMessage<T>('already', tag),
    );

    definitions.putIfAbsent(tag, () => Map<Type, Definition<Object>>())[T] =
        provider;
  }

  String assertRegisterMessage<T>(String word, String tag) {
    return 'The type $T was $word registered${tag == null ? '' : ' for the tag $tag'}';
  }

  /// Adds collaborating containers.
  void collaborate(List<DependencyContainer> containers) {
    this.collaborators = [...this.collaborators, ...containers];
  }

//  extension ResolveDependencyContainerExtensions on DependencyContainer {
  /// Resolve an instance of requested type.
  T resolve<T>([String tag]) => _resolve([this, ...this.collaborators], tag);

  T _resolve<T>(List<DependencyContainer> containers, [String tag]) {
    if (containers.length == 0) return null;

    T value;

    containers.forEach((dc) {
      Map<Type, Definition<Object>> providers = dc.definitions[tag];

      if (providers != null && value == null) {
        value = providers[T]?.get(this);
      }
      if (value == null) {
        value = _resolve(dc.collaborators, tag);
      }
    });
    return value;
  }

  /// Resolve an instance of requested type.
  /// Same as [resolve].
  T call<T>([String tag]) => resolve<T>(tag);

//}
//  extension RegisterDependencyContainerExtensions on DependencyContainer {
  /// Registers an instance into the container.
  ///
  /// An instance of type [T] can be registered with a
  /// supertype [S] if specified.
  ///
  /// If [tag] is set, the instance will be registered under this tag.
  /// To retrieve the same instance, the same tag should be provided
  /// to [DependencyContainer.resolve].
  void registerInstance<S, T extends S>(
    S instance, {
    String tag,
  }) {
    setProvider(tag, Definition<S>.instance(instance));
  }

  /// Registers a factory into the container.
  ///
  /// A factory returning an object of type [T] can be registered with a
  /// supertype [S] if specified.
  ///
  /// If [tag] is set, the factory will be registered under this tag.
  /// To retrieve the same factory, the same tag should be provided
  /// to [DependencyContainer.resolve].
  void register<S, T extends S>(
    Factory<S> factory, {
    String tag,
  }) {
    setProvider(tag, Definition<S>.factory(factory));
  }

  /// Registers a factory that will be called only only when
  /// accessing it for the first time, into the container.
  ///
  /// A factory returning an object of type [T] can be registered with a
  /// supertype [S] if specified.
  ///
  /// If [tag] is set, the factory will be registered under this tag.
  /// To retrieve the same factory, the same tag should be provided
  /// to [DependencyContainer.resolve].
  void registerSingleton<S, T extends S>(
    Factory<S> factory, {
    String tag,
  }) {
    setProvider(tag, Definition<S>.singleton(factory));
  }

  void unregister<T>([String tag]) {
    assert(silent || (definitions[tag]?.containsKey(T) ?? false),
        assertRegisterMessage<T>('not', tag));
    definitions[tag]?.remove(T);
  }
//}
}
