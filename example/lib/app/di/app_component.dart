import 'package:daggerito/daggerito.dart';
import 'package:example/app/di/common_module.dart';
import 'package:example/features/public/module.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppComponent extends Component {
  static var counter = 0;

  static Future<AppComponent> create() async => AppComponent._(
        sharedPreferences: await SharedPreferences.getInstance(),
      );

  AppComponent._({
    @required SharedPreferences sharedPreferences,
  }) : super(
          modules: [
            CommonModule(sharedPreferences),
            PublicModule(),
          ],
        ) {
    counter++;
  }
}


