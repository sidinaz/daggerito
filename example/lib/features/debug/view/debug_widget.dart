import 'package:example/app/di/app_component.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/features/book/component.dart';
import 'package:example/user/user_component.dart';
import 'package:flutter/material.dart';

class DebugWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text("AppComponent"),
              subtitle: Text(Messages.current.numberOfInitializations),
              trailing: Text("${AppComponent.counter}"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("UserComponent"),
              subtitle: Text(Messages.current.numberOfInitializations),
              trailing: Text("${UserComponent.counter}"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("BooksComponent"),
              subtitle: Text(Messages.current.numberOfInitializations),
              trailing: Text("${BookComponent.counter}"),
            ),
          ),
        ],
      );
}
