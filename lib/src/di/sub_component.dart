import 'component.dart';
import 'module.dart';

abstract class SubComponent extends Component {
  SubComponent(
    List<Component> components, {
    List<Module> modules = const [],
    bool silent,
  }) : super(
          modules: modules,
          silent: silent,
        ) {
    container.collaborate(
      components.map((c) => c.container).toList(),
    );
  }
}
