import 'package:example/app/database/database.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/app/ui/settings_expandable_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class LayoutSettingsExpandableItemView
    extends SettingExpandableItemView<LayoutGC> {

  get title => Messages.current.setLayout;
  get subtitle => Messages.current.setLayoutSubtitle;

  LayoutSettingsExpandableItemView(BehaviorSubject<LayoutGC> model)
      : super(model);

  @override
  Widget buildContent() => Observer(
        stream: asStream(),
        onSuccess: (ctx, model) => Container(
          child: Column(
            children: <Widget>[
              Observer(
                stream: asStream().map(($) => $.mainLayout),
                onSuccess: (ctx, value) => buildOptions(value),
              ),
            ],
          ),
        ),
      );

 get _options =>
      Map<int, Widget>.fromIterable(_values, key: (v) => v.item1, value: (v) => v.item2);

  List<Tuple2<int, Widget>> _values = [
    Tuple2(1, Padding(
      padding: EdgeInsets.all(5),
      child: Text('Sidebar'),
    )),
    Tuple2(2, Padding(
      padding: EdgeInsets.all(5),
      child: Text('Tabs'),
    )),
  ];

  Widget buildOptions(int value) =>
      PlatformWidget(
        ios: (context) => CupertinoSegmentedControl<int>(
          children: _options,
          onValueChanged: setMainLayoutType,
          groupValue: value,
//        selectedColor: Color(0xFFf4b512),
//        unselectedColor: Colors.white,
//        borderColor: Color(0xFF2C3E50),
        ) ,
        android: (context) => DropdownButton(
          onChanged: setMainLayoutType,
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
        ),
      );

  void setMainLayoutType(int value) {
    final model = fields.modelValue;
    model.mainLayout = value;
    push(model);
  }
}
