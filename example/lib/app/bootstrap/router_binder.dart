import 'package:example/app/bootstrap/custom_navigator.dart';
import 'package:example/app/bootstrap/titanium_app.dart';
import 'package:example/app/handler/auth_handler.dart';
import 'package:example/features/book/controller.dart';
import 'package:example/features/home/home_controller.dart';
import 'package:example/features/public/controller.dart';
import 'package:example/features/settings/settings_controller.dart';
import 'package:example/user/inject_components_controller.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';

import 'custom_future_builder.dart';

class RouterBinder {
  void bind() {
    RoutexNavigator routexNavigator =
        RoutexNavigator.newInstance(navigator: CustomNavigator());
    routexNavigator.futureBuilder = (future) => CustomFutureBuilder(future);
    final router = routexNavigator.router;

    router.route("/*").handler(
          TitaniumApp.appComponent.asHandler(),
        );

    router.route("/app/*").handler(
          AuthHandler(redirectTo: "/public/"),
        );

    PublicController().bindRouter(router);

    final userRouter = Router.router();

    [
      InjectComponentsController(),
      BooksController(),
      SettingsController(),
      HomeController(),
    ].forEach((c) => c.bindRouter(userRouter));

    router.mountSubRouter(
      "/app",
      userRouter,
    );
  }
}
