# Daggerito  
[![pub](https://img.shields.io/pub/v/daggerito?color=orange)](https://pub.dev/packages/daggerito)  

IoC container with Dagger like abstractions (dependency injection with Components, SubComponents, Modules), supports components collaboration, singletons, tagging.  

<img src="https://raw.githubusercontent.com/sidinaz/daggerito/master/documentation/images/daggerito_collaboration_diagram.png" width="100%" />  

## Example  
[Example](https://github.com/sidinaz/daggerito/tree/master/example/EXAMPLE.md)  
[Basic container test](https://github.com/sidinaz/daggerito/tree/master/test/container_test.dart)  
[Components collaboration test](https://github.com/sidinaz/daggerito/tree/master/test/example_test.dart)  
[Daggerito in usage (Routex app)](https://github.com/sidinaz/routex)  

### Code sample  
```dart
import 'example/components.dart';
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
```
```dart
class HModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => H1($(), $(), $(), $("t1"), $("t2"), $(), $()));
    container.register(($) => H2());
  }
}
```  
### Configuration 
Ignore assertion errors for unregistered types
```dart
// Globally  
Daggerito.configure(silent: true);

// or
// Component specific
  AppComponent._({
    @required SharedPreferences sharedPreferences,
  }) : super(
          modules: [
            CommonModule(sharedPreferences),
            PublicModule(),
          ],
          silent: true,
        )
```  
### Tips 
```dart
// When silent mode is off (default) use has to check for type availability.  
if(container.has<H1>())...

// Register as defined type
container.register((_) => SystemClock(), as: Clock);
```  
