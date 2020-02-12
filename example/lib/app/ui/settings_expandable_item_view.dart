import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
abstract class SettingExpandableItemView<T> extends BaseView {
  _SettingExpandableItemFields<T> fields;
  final BehaviorSubject<T> _model;
  double get maxHeight => fields.expanded ? 150 : 95;
  String title;
  String subtitle;
  final bool isInitiallyExpanded;

  SettingExpandableItemView(this._model, {this.isInitiallyExpanded = false});

  @override
  Widget buildWidget(BuildContext context) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: maxHeight,
        child: Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(title ?? ""),
                subtitle: Text(
                  subtitle ?? "",
                ),
                trailing: IconButton(
                  icon: Icon(
                      fields.expanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    fields.expanded = !fields.expanded;
                    setState();
                  },
                ),
              ),
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: SingleChildScrollView(child: buildContent()),
                ),
              )
            ],
          ),
        ),
      );

  Widget buildContent();

  @override
  void handleManagedFields() {
    fields = managedField(() => _SettingExpandableItemFields(_model, isInitiallyExpanded));
  }

  void push(T model) =>
    fields.model.add(model);

  Stream<T> asStream() => fields.model;
}

class _SettingExpandableItemFields<T> {
  final BehaviorSubject<T> model;
  T get modelValue => model.value;
  var expanded;

  _SettingExpandableItemFields(this.model, this.expanded);
}
