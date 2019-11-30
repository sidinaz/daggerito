import 'dependency_container.dart';
import 'definition.dart';

extension DependencyContainerExtensions on DependencyContainer{

  /// Registers an instance into the container.
  ///
  /// An instance of type [T] can be registered with a
  /// supertype [S] if specified.
  ///
  /// If [tag] is set, the instance will be registered under this name.
  /// To retrieve the same instance, the same name should be provided
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
  /// If [tag] is set, the factory will be registered under this name.
  /// To retrieve the same factory, the same name should be provided
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
  /// If [tag] is set, the factory will be registered under this name.
  /// To retrieve the same factory, the same name should be provided
  /// to [DependencyContainer.resolve].
  void registerSingleton<S, T extends S>(
    Factory<S> factory, {
      String tag,
    }) {
    setProvider(tag, Definition<S>.singleton(factory));
  }

  /// Removes the entry previously registered for the type [T].
  ///
  /// If [tag] is set, removes the one registered for that name.
  void unregister<T>([String tag]) {
    assert(silent || (namedProviders[tag]?.containsKey(T) ?? false),
    assertRegisterMessage<T>('not', tag));
    namedProviders[tag]?.remove(T);
  }
}