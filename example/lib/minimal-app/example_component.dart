import 'package:daggerito/daggerito.dart';
import 'package:example/minimal-app/example_module.dart';

class ExampleComponent extends Component {
  ExampleComponent()
      : super(
          modules: [
            ExampleModule(),
          ],
        );
}
