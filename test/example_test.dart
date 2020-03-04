import 'package:daggerito/daggerito.dart';
import 'package:test/test.dart';

import 'example/models.dart';
import 'example/modules.dart';

void main() {
  test('Components collaboration test', () {
    var aComponent = Component(modules: [AModule(), BModule(), CModule()]);
    var bComponent = SubComponent(aComponent, modules: [DModule(), EModule()]);
    var cComponent = SubComponent(bComponent, modules: [FModule(), GModule()]);
    var dComponent = SubComponent(cComponent, modules: [HModule(), IModule()]);

    //Component is dart callable class, same as component.container.resolve()
    var hasModel = dComponent.container.has<H1>();
    expect(hasModel, isTrue);
    expect(aComponent.container.has<F1>("t1"), isFalse);
    expect(bComponent.container.has<F1>("t1"), isFalse);
    expect(cComponent.container.has<F1>("t1"), isTrue);
    expect(dComponent.container.has<F1>("t1"), isTrue);
    print(dComponent.container.definitions);
  });
}
