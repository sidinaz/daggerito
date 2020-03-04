import 'package:daggerito/daggerito.dart';
import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/di/app_component.dart';
import 'package:example/features/home/home_module.dart';
import 'package:example/user/user_module.dart';
import 'package:example/user/user_ui_module.dart';
import 'package:flutter/material.dart';

class UserComponent extends SubComponent {
  static var counter = 0;

  UserComponent({
    @required AppComponent appComponent,
    @required UserInfo userInfo,
  }) : super(
          appComponent,
          modules: [
            UserModule(userInfo.userEntity),
            UserUIModule(userInfo: userInfo),
            HomeModule(),
          ],
        ) {
    counter++;
  }
}
