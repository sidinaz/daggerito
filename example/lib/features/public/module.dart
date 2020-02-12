import 'package:daggerito/daggerito.dart';
import 'package:example/features/debug/view/view.dart';
import 'package:example/features/public/data/model.dart';
import 'package:example/features/public/view/create_user_view.dart';
import 'package:example/features/public/view/debug_view.dart';

import './data/view_model.dart';
import './view/view.dart';

class PublicModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.registerSingleton(($) => CreateUserSink());
    container.registerSingleton(($) => CreateUserInput($()));
    container.registerSingleton(($) => PublicViewModel($(), $(),$()));
    container.register(($) => CreateUserView($(),$()));
    container.register(($) => PublicView($()));
    container.register(($) => PublicDebugView());
  }
}
