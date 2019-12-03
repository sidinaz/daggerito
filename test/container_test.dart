import 'package:daggerito/daggerito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'example/models.dart';

abstract class _Service{}

class _ServiceImpl1 implements _Service{}

class _ServiceImpl2 implements _Service{}

void main() {
  test('Basic container test', () {
    var container = DependencyContainer();

    //registers function that will be recalled on each resolve call
    container.register((_) => A1());

    //register function that will called only once, on first resolve call
    container.registerSingleton((_) => D1());

    //provide already created instance, similar behaviour as singleton, without factory function needed.
    container.registerInstance(7);

    expect(identical(container<A1>(), container<A1>()), isFalse);
    expect(identical(container<D1>(), container<D1>()), isTrue);
    expect(container<int>() == 7, isTrue);
  });

  test('Tagging test', () {
    var container = DependencyContainer();

    container.register((_) => A1(), tag: "registered_as_factory");

    container.registerSingleton((_) => A1(), tag: "registered_as_singleton");

    expect(
      identical(
        container<A1>("registered_as_factory"),
        container<A1>("registered_as_factory"),
      ),
      isFalse,
    );
    
    expect(
      identical(
        container<A1>("registered_as_singleton"),
        container<A1>("registered_as_singleton"),
      ),
      isTrue,
    );
  });
  test('Register as implementation of interface test', () {
    var container = DependencyContainer();

    container.register((_) => _ServiceImpl1() as _Service);

    container.register((_) => _ServiceImpl1() as _Service, tag: "service_1");

    container.register((_) => _ServiceImpl2() as _Service, tag: "service_2");

    container.register((_) => _ServiceImpl1());

    container.register((_) => _ServiceImpl2());

    expect(container<_Service>() != null, isTrue);
    expect(container<_Service>("service_1") != null, isTrue);
    expect(container<_Service>("service_2") != null, isTrue);
    expect(container<_ServiceImpl1>() != null, isTrue);
    expect(container<_ServiceImpl2>() != null, isTrue);
  });
}
