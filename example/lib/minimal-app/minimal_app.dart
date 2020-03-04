import 'package:example/app/bootstrap/route_info.dart';
import 'package:example/minimal-app/example_component.dart';
import 'package:example/minimal-app/example_view.dart';
import 'package:flutter/material.dart';
import 'package:kohana/kohana.dart';
import 'package:routex/routex.dart';

// ignore: must_be_immutable
class MinimalApp extends BaseView with TitaniumApp<ExampleComponent> {
  @override
  ComponentFactory<ExampleComponent> get appComponentFactory =>
      () async => Future.value(
            ExampleComponent(),
          );

  @override
  RouterBinder get binder => RouterBinder(
        [
          RouterBindable(
            before: (router) {
              router.route("/*").handler(
                    TitaniumApp.appComponent.asHandler(),
                  );
              router.route("/").handler(homeViewHandler);
            },
          ),
        ],
        routerFactory,
      );

  @override
  Widget buildWidget(BuildContext context) => isReady
      ? MaterialApp(
          home: managedView("/")(context),
        )
      : Container();

  @override
  void onAppComponentCreated(ExampleComponent appComponent) {
    startApplication();
  }

  WidgetBuilder homeViewHandler(RoutingContext context) =>
      (_) => context<ExampleView>();
}
