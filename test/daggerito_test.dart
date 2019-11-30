// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:daggerito/src/di/component.dart';
import 'package:daggerito/src/dependency_container.dart';
import 'package:daggerito/src/register.dart';
import 'package:daggerito/src/resolve.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/book.dart';
import 'models/user_repository.dart';

class AppComponent implements Component {
  final DependencyContainer _container;

  AppComponent(List<Module> modules)
    : _container = DependencyContainer()
    ..collaborate([containerTestInstance()]) {
    modules.forEach(
        (module) => module.register(_container),
    );
  }

  @override
  DependencyContainer container() => _container;
}

class AppModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.registerInstance("Ovo je naslov knjige");
    container.register((dc) => Book(title: dc("naslov")));
//    container.register((_) => UserRepository());
    container.registerSingleton((_) => UserRepository());
  }
}

/*
*   init<C : Component>(module: M, parentComponent: C){
        self.init(module : module)
        parentComponent.container.collaborate(with: container)
        module.register(container: container)
    }
* */

class UserComponent extends ChildComponent {
  UserComponent(LoginModule loginModule, AppComponent appComponent)
    : super(appComponent, module: loginModule);
}

class ContactsComponent extends ChildComponent {
  ContactsComponent(UserComponent userComponent) : super(userComponent);
}

class LoginModule extends Module {
  @override
  void register(DependencyContainer container) {}
}

void main() {
  testWidgets('Component collaboration test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    AppModule appModule = AppModule();
    AppComponent appComponent = AppComponent([appModule]);
    UserComponent userComponent = UserComponent(LoginModule(), appComponent);
    ContactsComponent contactsComponent = ContactsComponent(userComponent);

//    Book book = appComponent.container.resolve();
    Book book2 = contactsComponent.container().resolve();
    UserRepository repo1 = userComponent.container().resolve();
    UserRepository repo2 = contactsComponent.container().resolve();
    UserRepository repo3 = contactsComponent.container().resolve();

//    expect(book != null, isTrue);
    expect(book2 != null, isTrue);
    print("Naslov knjige je: ${book2.title}");
    repo1.test();
    repo2.test();
    repo3.test();
  });
}

DependencyContainer containerTestInstance() {
  var container = DependencyContainer();
  container.registerInstance("Ovo je naslov sa tagom", tag: "naslov");
  return container;
}
