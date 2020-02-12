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
class LocaleSettingsExpandableItemView
    extends SettingExpandableItemView<LookGC> {
  LocaleSettingsExpandableItemView(BehaviorSubject<LookGC> model)
      : super(model);

  get title => Messages.current.setLocale;
  get subtitle => Messages.current.setLocaleSubtitle;

  @override
  Widget buildContent() => Observer<LookGC>(
        stream: asStream(),
        onSuccess: (ctx, model) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer<String>(
              stream: asStream().map(($) => $.locale ?? "default"),
              onSuccess: (ctx, value) => buildPicker(value),
            ),
          ],
        ),
      );

  void setLocale(String value) {
    if (value == "default") value = null;
    final model = fields.modelValue;
    model.locale = value;
    push(model);
  }

  List<Tuple2<String, Widget>> _values = [
    Tuple2("default", Container(
        height: 40,
        child: Center(child: Text('Default')))),
    Tuple2("en",         Container(
      width: 200,
      child: Row(
//        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image(
                  width: 100,
                  height: 40,
                  image: AssetImage('assets/images/gb.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
//          SizedBox(width: 5,),
          Text('En'),
        ],
      ),
    )),
    Tuple2(
        "bs",
        Container(
          width: 200,
          child: Row(
//        mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Image(
                      width: 100,
                      height: 40,
                      image: AssetImage('assets/images/ba.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
//          SizedBox(width: 5,),
              Text('Bs'),
            ],
          ),
        )),
  ];

  Widget buildPicker([String selectedValue = "default"]) => PlatformWidget(
        android: (context) => DropdownButton(
          onChanged: setLocale,
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
                          scrollController: FixedExtentScrollController(
                              initialItem: _values
                                  .map(($) => $.item1)
                                  .toList()
                                  .indexOf(selectedValue)),
                          itemExtent: 50,
                          //height of each item
                          backgroundColor: CupertinoTheme.of(context)
                              .scaffoldBackgroundColor,
                          onSelectedItemChanged: (index) =>
                              setLocale(_values[index].item1),
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
