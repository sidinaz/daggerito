import 'definition.dart';



/// A simple service container.
class DependencyContainer {
  /// Creates a scoped container.
  DependencyContainer()
    : namedProviders = Map<String, Map<Type, Definition<Object>>>();

  final Map<String, Map<Type, Definition<Object>>> namedProviders;

  /// Whether ignoring assertion errors in the following cases:
  /// * if you register the same type under the same name a second time.
  /// * if you try to resolve or unregister a type that was not
  /// previously registered.
  ///
  /// Defaults to true.
  bool silent = true;

  /// Colaborators

  List<DependencyContainer> collaborators = [];
  /// Removes all instances and builders from the container.
  ///
  /// After this, the container is empty.
  void clear() {
    namedProviders.clear();
  }

  void setProvider<T>(String name, Definition<T> provider) {
    assert(
    silent ||
      (!namedProviders.containsKey(name) ||
        !namedProviders[name].containsKey(T)),
    assertRegisterMessage<T>('already', name),);

    namedProviders.putIfAbsent(name, () => Map<Type, Definition<Object>>())[T] =
      provider;
  }

  String assertRegisterMessage<T>(String word, String name) {
    return 'The type $T was $word registered${name == null ? '' : ' for the name $name'}';
  }
}

//

extension DependencyContainerExtensions on DependencyContainer{
  void collaborate(List<DependencyContainer> containers){
    this.collaborators = [...this.collaborators, ...containers];
  }
}