import 'package:example/app/locale/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:example/app/database/database.dart';
import 'package:example/app/ui/settings_expandable_item_view.dart';
import 'package:kohana/kohana.dart';
import 'package:routex/routex.dart';
import 'package:rxdart/rxdart.dart';

// ignore: must_be_immutable
class ThemeSettingsExpandableItemView extends SettingExpandableItemView<LookGC> {
  ThemeSettingsExpandableItemView(BehaviorSubject<LookGC> model) : super(model);

  get title => Messages.current.setTheme;
  get subtitle => Messages.current.setThemeSubtitle;

  @override
  Widget buildContent() => Observer<LookGC>(
        stream: asStream(),
        onSuccess: (ctx, model) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Observer<int>(
              stream: asStream().map(($) => $.theme),
              onSuccess: (ctx, value) => buildOptions(value),
            ),

          ],
        ),
      );

  get _options =>
      Map<int, Widget>.fromIterable(_values, key: (v) => v.item1, value: (v) => v.item2);

  List<Tuple2<int, Widget>> _values = [
    Tuple2(1, Padding(
      padding: EdgeInsets.all(5),
      child: Text('Light'),
    )),
    Tuple2(10, Padding(
      padding: EdgeInsets.all(5),
      child: Text('Dark'),
    )),
  ];

  Widget buildOptions(int value) => PlatformWidget(
    ios: (context) =>
        CupertinoSegmentedControl<int>(
          children: _options,
          onValueChanged: setTheme,
          groupValue: value,
        ),
      android: (context) => DropdownButton(
        onChanged: setTheme,
        value: value,
        items: [
          DropdownMenuItem(
            value: _values[0].item1,
            child: _values[0].item2,
          ),
          DropdownMenuItem(
            value: _values[1].item1,
            child: _values[1].item2,
          ),
        ],
      )
  );

  void setTheme(int value) {
    final model = fields.modelValue;
    model.theme = value;
    push(model);
  }
}
