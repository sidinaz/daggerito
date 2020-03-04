import 'package:daggerito/daggerito.dart';

import 'component.dart';
import 'module.dart';

class SubComponent extends Component {
  SubComponent(
    Component parentComponent, {
    List<Module> modules = const [],
    bool silent,
    DependencyContainer container,
  }) : super(
          modules: modules,
          silent: silent,
          container: container,
        ) {
    this.container.collaborate([parentComponent.container]);
  }
}
