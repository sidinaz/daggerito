import 'package:example/app/database/database.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/app/settings/app_settings.dart';
import 'package:example/features/settings/view/layout_settings_expandable_item_view.dart';
import 'package:example/features/settings/view/locale_settings_expandable_item_view.dart';
import 'package:example/features/settings/view/look_settings_expandable_item_view.dart';
import 'package:example/features/settings/view/platform_settings_expandable_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';

import '../data/data.dart';

// ignore: must_be_immutable
class SettingsView extends BaseView {
  final title = Messages.current.settings;
  final SettingsViewModel model;
  _Fields fields;

  final List<String> items = ["prvi", "drugi"];

  SettingsView(this.model);

  @override
  Widget buildWidget(BuildContext context) => PlatformScaffold(
        body: NestedScrollView(
          headerSliverBuilder: (ctx, isb) => [
            PlatformWidget(
              android: (ctx) => SliverAppBar(
                title: buildTitle(),
                actions: [buildSaveButton()],
                floating: true,
                snap: true,
                pinned: true,
              ),
              ios: (ctx) => CupertinoSliverNavigationBar(
                largeTitle: buildTitle(),
                trailing: buildSaveButton(),
                transitionBetweenRoutes: false,
              ),
            ),
          ],
          body: Container(
            child: ListView(
              children: <Widget>[
                LayoutSettingsExpandableItemView(fields.layoutGCSubject),
                ThemeSettingsExpandableItemView(fields.lookGCSubject),
                PlatformSettingsExpandableItemView(fields.lookGCSubject),
                LocaleSettingsExpandableItemView(fields.lookGCSubject),
              ],
            ),
          ),
        ),
      );

  Widget buildTitle() => Text(title);

  Widget buildSaveButton() => Observer<AppSettingsModel>(
        stream: fields.appSettingsModel,
        onSuccess: (_, model) => model ==
                AppSettingsModel(
                    layoutGC: LayoutGC.fromLayoutDb(fields.layoutDB),
                    lookGC: fields.lookGC)
            ? FlatButton(
                child: PlatformText(Messages.current.saveChanges,),
              )
            : FlatButton(
                child: PlatformText(Messages.current.saveChanges,),
                onPressed: () => updateUserInfo(model),
              ),
      );

  @override
  void handleManagedFields() {
    final layoutDB = model.userInfo.layoutDB;
    final lookGC = model.userInfo.lookGC;
    fields = managedField(() => _Fields(layoutDB, lookGC));
  }

  void updateUserInfo(AppSettingsModel appSettingsModel) {
    var subscription = model.updateUserInfo(appSettingsModel).listen((result) {
      EventBus().push(AppEvent(AppEventType.RESTART));
      Navigator.of(context).pop();
    }, onError: print);
    disposeBag.add(subscription);
  }

  @override
  void componentDidMount() {
    print(model.userInfo);
  }
}

class _Fields {
  final LayoutDB layoutDB;
  final LookGC lookGC;
  final BehaviorSubject<LayoutGC> layoutGCSubject;
  final BehaviorSubject<LookGC> lookGCSubject;

  Stream<AppSettingsModel> get appSettingsModel => Rx.combineLatest2(
      layoutGCSubject,
      lookGCSubject,
      (a, b) => AppSettingsModel(layoutGC: a, lookGC: b)).share();

  _Fields(LayoutDB layoutDB, LookGC lookGC)
      : this.layoutDB = layoutDB,
        this.lookGC = lookGC,
        this.lookGCSubject = BehaviorSubject.seeded(lookGC.clone()),
        this.layoutGCSubject =
            BehaviorSubject.seeded(LayoutGC.fromLayoutDb(layoutDB));
}
