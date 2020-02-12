import 'package:example/app/bootstrap/titanium_app.dart';
import 'package:routex/routex.dart';

class AuthHandler implements Handler<RoutingContext> {
  final String redirectTo;

  AuthHandler({this.redirectTo});

  @override
  Future<void> handle(RoutingContext context) async {
    if (TitaniumApp.loggedIn) {
      context.next();
    } else {
      if (redirectTo != null) {
        context.reroute(redirectTo);
      } else {
        context.fail(401);
      }
    }
  }
}
