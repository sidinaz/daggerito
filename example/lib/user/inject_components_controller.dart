import 'package:example/app/bootstrap/titanium_app.dart';
import 'package:example/features/book/component.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';

class InjectComponentsController implements BaseController {
  @override
  void bindRouter(Router router) {
    /// mounted on subRouter, available on "/app/*"
    router.route("/*").handler(TitaniumApp.userComponent.asHandler());

    router.route("/books/*").handler(_createDetailsComponentHandler());
  }
}

_createDetailsComponentHandler() => CreateComponentHandler(
      factory: (context) async => BooksComponent(
        TitaniumApp.userComponent,
        bookValidators: context.getParam("validators"),
        book: context.getParam("book"),
      ),
    );
