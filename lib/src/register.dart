import 'definition.dart';
import 'dependency_container.dart';

extension RegisterDependencyContainerExtensions on DependencyContainer {
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
}
