import 'package:example/app/database/database.dart';
import 'package:example/user/user_component.dart';

class LayoutManager {
  final int mainLayout;
  final int index = UserComponent.counter;

  LayoutManager._(this.mainLayout);

  factory LayoutManager(LayoutDB layoutDB) =>
      LayoutManager._(layoutDB.mainLayout);

  @override
  String toString() {
    return 'LayoutManager{mainLayout: $mainLayout}';
  }
}
