import 'package:flutter/material.dart';

class ExampleView extends StatelessWidget {
  final String title;
  final String message;

  ExampleView(this.title, this.message);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      );
}
