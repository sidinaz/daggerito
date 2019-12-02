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
}
