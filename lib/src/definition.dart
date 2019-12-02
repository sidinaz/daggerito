import 'dependency_container.dart';

typedef T Factory<T>(DependencyContainer container);

class Definition<T> {
  Definition.instance(this.object)
      : instanceBuilder = null,
        _oneTime = false;

  Definition.factory(this.instanceBuilder) : _oneTime = false;

  Definition.singleton(this.instanceBuilder) : _oneTime = true;

  final Factory<T> instanceBuilder;
  T object;
  bool _oneTime = false;

  T get(DependencyContainer container) {
    if (_oneTime && instanceBuilder != null) {
      object = instanceBuilder(container);
      _oneTime = false;
    }

    if (object != null) {
      return object;
    }

    if (instanceBuilder != null) {
      return instanceBuilder(container);
    }

    return null;
  }
}
