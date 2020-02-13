import 'package:example/features/book/component.dart';
import 'package:kohana/kohana.dart';
import 'package:routex/routex.dart';

class InjectComponentsController implements Controller {
  @override
  void bindRouter(Router router) {
    /// mounted on subRouter, available on "/app/*"
    router.route("/*").handler(TitaniumApp.appSubComponent.asHandler());

    router.route("/books/*").handler(_bookComponentHandler());
  }
}

_bookComponentHandler() => CreateComponentHandler(
      factory: (context) async => BookComponent(
        context.getComponent(),
        bookValidators: context.getParam("validators"),
        book: context.getParam("book"),
      ),
    );
