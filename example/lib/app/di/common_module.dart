import 'package:daggerito/daggerito.dart';
import 'package:example/app/data/app_repository.dart';
import 'package:example/app/database/database.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/app/theme/theme_manager.dart';
import 'package:example/app/util/clock.dart';
import 'package:example/app/util/default_shared_preferences.dart';
import 'package:kohana/kohana.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonModule implements Module {
  final SharedPreferences _sharedPreferences;

  CommonModule(this._sharedPreferences);

  @override
  void register(DependencyContainer container) {
    container.register((_) => _sharedPreferences);
    container.register(($) => DefaultSharedPreferences($()));
    container.registerSingleton((_) => AppDb());
    container.register((_) => SystemClock() as Clock);
    container.register(($) => AppRepository($(), $()));
    container.registerSingleton(($) => ThemeManager());
    container.register((_) => Messages.current);
  }
}
