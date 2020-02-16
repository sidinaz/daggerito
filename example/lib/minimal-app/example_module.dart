import 'package:daggerito/daggerito.dart';
import 'package:example/minimal-app/example_view.dart';

class ExampleModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(($) => "Hello daggerito app :)");
    container.register(($) => "This is content message", tag: "message");
    container.register(($) => ExampleView($(), $("message")));
  }
}
