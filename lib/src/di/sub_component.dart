import 'component.dart';
import 'module.dart';

abstract class SubComponent extends Component {
  SubComponent(
    List<Component> components, {
    List<Module> modules = const [],
  }) : super(modules: modules) {
    container.collaborate(
      components.map((c) => c.container).toList(),
    );
  }
}
