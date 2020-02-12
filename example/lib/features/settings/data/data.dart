import 'package:example/app/database/database.dart';
import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/database/user_settings_repository.dart';
import 'package:example/app/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';

class SettingsViewModel extends BaseViewModel {
  final UserInfo userInfo;
  final UserSettingsRepository repository;

  SettingsViewModel(this.userInfo, this.repository);

  String get username => userInfo.userEntity.username;

  Stream<int> updateUserInfo(AppSettingsModel appSettingsModel) {
    final currentLayout = LayoutGC.fromLayoutDb(userInfo.layoutDB);
    final currentLook = userInfo.lookGC;

    final List<Stream<int>> sources = [];

    if (currentLayout != appSettingsModel.layoutGC) {
      sources.add(repository.updateUserLayout(
        mainLayout: appSettingsModel.layoutGC.mainLayout,
      ));
    }

    if (currentLook != appSettingsModel.lookGC) {
      sources.add(
        repository.updateUserInfo(
          theme: appSettingsModel.lookGC.theme,
          locale: appSettingsModel.lookGC.locale,
          platform: appSettingsModel.lookGC.platform,
        ),
      );
    }

    return Rx.zipList(sources).map((_) => 1);
  }
}