import 'package:example/app/bootstrap/custom_future_builder.dart';
import 'package:example/app/bootstrap/custom_navigator.dart';
import 'package:routex/routex.dart';

class RouteInfo {
  final String path;
  final Map<String, dynamic> params;

  RouteInfo(this.path, {this.params});
}

Router routerFactory() {
  RoutexNavigator routexNavigator =
      RoutexNavigator.newInstance(navigator: CustomNavigator());
  routexNavigator.futureBuilder = (future) => CustomFutureBuilder(future);
  return routexNavigator.router;
}
