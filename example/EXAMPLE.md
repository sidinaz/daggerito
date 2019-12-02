<img src="https://raw.githubusercontent.com/sidinaz/daggerito/master/documentation/images/daggerito_collaboration_diagram.png" width="100%" />  


```dart
import 'package:flutter_test/flutter_test.dart';

import 'example/components.dart';
import 'example/models.dart';
import 'example/modules.dart';

void main() {
  test('Components collaboration test', () {
    var aComponent = AComponent([AModule(), BModule(), CModule()]);
    var bComponent = BComponent(aComponent, [DModule(), EModule()]);
    var cComponent = CComponent([FModule(), GModule()]);
    var dComponent =
        DComponent([bComponent, cComponent], [HModule(), IModule()]);

    //Component is dart callable class, same as component.container.resolve()
    H1 model = dComponent();
    expect(model != null, isTrue);
  });
}
```

```dart
class HModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => H1($(), $(), $(), $("t1"), $("t2"), $(), $()));
    container.register(($) => H2());
  }
}

class DComponent extends SubComponent {
  DComponent(
    List<Component> components,
    List<Module> modules,
  ) : super(components, modules: modules);
}

class H1 {
  H1(A2 model1, B1 model2, D1 model3, F1 model4, F1 model5, H2 model6,
      I2 model7) {
    assert(model1 != null);
    assert(model2 != null);
    assert(model3 != null);
    assert(model4 != null);
    assert(model5 != null);
    assert(model6 != null);
    assert(model7 != null);
    assert(model4.description != model5.description);
  }
}
```
##Example
[Example](https://github.com/sidinaz/daggerito/tree/master/example/EXAMPLE.md)  
[Daggerito tests](https://github.com/sidinaz/daggerito/tree/master/test/example_test.dart)  
[Daggerito in usage (Routex app)](https://github.com/sidinaz/routex)  
