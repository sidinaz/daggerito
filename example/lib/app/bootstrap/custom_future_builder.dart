import 'package:flutter/material.dart';

class CustomFutureBuilder extends StatelessWidget {
  final Future<WidgetBuilder> _calculation;

  Widget get container =>
    Container(
    );

  CustomFutureBuilder(this._calculation);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WidgetBuilder>(
      future: _calculation, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<WidgetBuilder> snapshot) =>
        Offstage(
          offstage: snapshot.connectionState != ConnectionState.done,
          child: buildChild(context, snapshot),
        ),
    );
  }

  Widget buildChild(BuildContext context,
    AsyncSnapshot<WidgetBuilder> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return container;
      case ConnectionState.active:
      case ConnectionState.waiting:
        return container;
      case ConnectionState.done:
        if (snapshot.hasError)
          return container;
        return snapshot.data(context);
    }
    return null; // unreachable
  }
}
