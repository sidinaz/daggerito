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
class PlatformSettingsExpandableItemView
    extends SettingExpandableItemView<LookGC> {
  PlatformSettingsExpandableItemView(BehaviorSubject<LookGC> model)
      : super(model);

  get title => Messages.current.setPlatform;
  get subtitle => Messages.current.setPlatformSubtitle;

  @override
  Widget buildContent() => Observer<LookGC>(
        stream: asStream(),
        onSuccess: (ctx, model) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer<String>(
              stream: asStream().map(($) => $.platform ?? "default"),
              onSuccess: (ctx, value) => buildPicker(value),
            ),
          ],
        ),
      );

  void setPlatform(String value) {
    if (value == "default") value = null;
    final model = fields.modelValue;
    model.platform = value;
    push(model);
  }

  List<Tuple2<String, Widget>> _values = [
    Tuple2("default", Text("Default")),
    Tuple2("ios", Text("iOS")),
    Tuple2("android", Text("Android")),
  ];

  Widget buildPicker([String selectedValue = "default"]) => PlatformWidget(
        android: (context) => DropdownButton(
          onChanged: setPlatform,
          value: selectedValue,
          items: [
            DropdownMenuItem(
              value: _values[0].item1,
              child: _values[0].item2,
            ),
            DropdownMenuItem(
              value: _values[1].item1,
              child: _values[1].item2,
            ),
            DropdownMenuItem(
              value: _values[2].item1,
              child: _values[2].item2,
            ),
          ],
        ),
        ios: (context) => Center(
          child: FlatButton(
            onPressed: () {
              showPlatformModalSheet(
                  context: context,
                  builder: (context) => Container(
                        height: 200,
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(initialItem: _values.map(($) => $.item1).toList().indexOf(selectedValue)),
                          magnification: 1.2,
                          itemExtent: 50,
                          //height of each item
                          backgroundColor: CupertinoTheme.of(context)
                              .scaffoldBackgroundColor,
                          onSelectedItemChanged: (index) => setPlatform(_values[index].item1),
                          children: <Widget>[
                            Center(child: _values[0].item2),
                            Center(child: _values[1].item2),
                            Center(child: _values[2].item2),
                          ],
                        ),
                      ));
            },
            child: _values
                .where((value) => value.item1 == selectedValue)
                .first
                .item2,
          ),
        ),
      );
}

