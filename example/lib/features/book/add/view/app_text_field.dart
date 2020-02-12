import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:kohana/kohana.dart';

class AppTextField extends StatelessWidget {
  final Stream<Signal> stream;
  final Function onChanged;
  final String labelText;
  final TextEditingController controller;

  AppTextField({
    @required this.stream,
    @required this.onChanged,
    @required this.labelText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: stream,
        builder: (ctx, snapshot) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PlatformTextField(
              controller: controller,
              onChanged: onChanged,
              android: (_) => MaterialTextFieldData(
                  decoration: InputDecoration(
                      labelText: labelText,
                      errorText: snapshot.error != null
                          ? snapshot.error.toString()
                          : null)),
              ios: (_) => CupertinoTextFieldData(
                placeholder: labelText,
              ),
            ),
            Offstage(
              offstage:
                  PlatformProvider.of(context).platform != TargetPlatform.iOS,
              child:
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(snapshot.error != null ? snapshot.error.toString() : "", style: Theme.of(context).textTheme.body2.copyWith(color: Colors.red),),
                  ),
            ),
          ],
        ),
      );
}
