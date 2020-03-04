import 'package:daggerito/src/container_configuration.dart';

import 'definition.dart';

class DependencyContainer {
  DependencyContainer({bool silent}) : this._silent = silent;

  final definitions = Map<String, Map<Type, Definition<Object>>>();

  /// Whether ignoring assertion errors in the following cases:
  /// * if you register the same type under the same tag a second time.
  /// * if you try to resolve or unregister a type that was not
  /// previously registered.
  ///
  /// Defaults to false.
  bool _silent = false;

  bool get silent => _silent ?? ContainerConfiguration.silent;

  List<DependencyContainer> collaborators = [];

  void clear() => definitions.clear();

  /// Use a tag in case you need to register multiple factories fo the same type, to differentiate them.
  void setDefinition<T>(String tag, Definition<T> definition, [Type _as]) {
    _as ??= T;
    assert(
      silent ||
          (!definitions.containsKey(tag) || !definitions[tag].containsKey(_as)),
      assertRegisterMessage<T>('already', tag, _as),
    );

    definitions.putIfAbsent(tag, () => Map<Type, Definition<Object>>())[_as] =
        definition;
  }

  String assertRegisterMessage<T>(String word, String tag, [Type _as]) {
    _as ??= T;
    return 'The type $_as was $word registered${tag == null ? '' : ' for the tag $tag'}';
  }

  /// Adds collaborating containers.
  void collaborate(List<DependencyContainer> containers) {
    this.collaborators = [...this.collaborators, ...containers];
  }

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
    Type as,
  }) {
    setDefinition(tag, Definition<S>.instance(instance), as);
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
    Type as,
  }) {
    setDefinition(tag, Definition<S>.factory(factory), as);
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
    Type as,
  }) {
    setDefinition(tag, Definition<S>.singleton(factory), as);
  }

  void unregister<T>([String tag]) {
    assert(silent || (definitions[tag]?.containsKey(T) ?? false),
        assertRegisterMessage<T>('not', tag));
    definitions[tag]?.remove(T);
  }

  /// Resolve an instance of requested type.
  T resolve<T>([String tag]) => _resolve(
        [this, ...this.collaborators],
        tag,
      );

  T _resolve<T>(
    List<DependencyContainer> containers, [
    String tag,
    bool found,
  ]) {
    if (containers.length == 0) return null;

    T value;
    bool _found = found;
    var condition = false;

    containers.forEach((dependencyContainer) {
      Map<Type, Definition<Object>> definitions =
          dependencyContainer.definitions[tag];

      final collaborators = dependencyContainer.collaborators;
      if (definitions != null && _found == null) {
        if (definitions?.containsKey(T) ?? false) {
          value = definitions[T]?.get(this);
          _found = true;
        }
      }

      if (!(_found ?? false)) {
        value = _resolve(collaborators, tag, _found);
      }
      condition = _found ?? false || silent || collaborators.length > 0;
    });

    assert(
        condition,
        assertRegisterMessage<T>(
          'not',
          tag,
        ));
    return value;
  }

  /// Check for a definition of an instance of requested type.
  bool has<T>([String tag]) => _has<T>(
        [this, ...this.collaborators],
        tag,
      );

  bool _has<T>(
    List<DependencyContainer> containers, [
    String tag,
    bool found,
  ]) {
    if (containers.length == 0) return null;

    bool _found = found;

    containers.forEach((dependencyContainer) {
      Map<Type, Definition<Object>> definitions =
          dependencyContainer.definitions[tag];

      final collaborators = dependencyContainer.collaborators;
      if (definitions != null && _found == null) {
        if (definitions?.containsKey(T) ?? false) {
          _found = true;
        }
      }

      if (!(_found ?? false)) {
        _found = _has<T>(collaborators, tag, _found);
      }
    });

    return _found ?? false;
  }

  /// Resolve an instance of requested type.
  /// Same as [resolve].
  T call<T>([String tag]) => resolve<T>(tag);
}
