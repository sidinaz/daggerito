import 'package:daggerito/daggerito.dart';

class AComponent extends Component {
  AComponent(List<Module> modules) : super(modules: modules);
}

class BSubComponent extends SubComponent {
  BSubComponent(
    AComponent component,
    List<Module> modules,
  ) : super([component], modules: modules);
}

class CComponent extends Component {
  CComponent(List<Module> modules) : super(modules: modules);
}

class DSubComponent extends SubComponent {
  DSubComponent(
    List<Component> components,
    List<Module> modules,
  ) : super(components, modules: modules);
}
