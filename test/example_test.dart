import 'package:flutter_test/flutter_test.dart';

import 'example/components.dart';
import 'example/models.dart';
import 'example/modules.dart';

void main() {
  test('Components collaboration test', () {
    var aComponent = AComponent([AModule(), BModule(), CModule()]);
    var bComponent = BSubComponent(aComponent, [DModule(), EModule()]);
    var cComponent = CComponent([FModule(), GModule()]);
    var dComponent =
        DSubComponent([bComponent, cComponent], [HModule(), IModule()]);

    //Component is dart callable class, same as component.container.resolve()
    H1 model = dComponent();
    expect(model != null, isTrue);
  });
}
