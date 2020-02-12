import 'package:example/app/database/database.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class BookDetailsView extends StatelessWidget {
  final BookDB model;

  BookDetailsView(this.model);

  @override
  Widget build(BuildContext context) => PlatformScaffold(
    iosContentPadding: true,
    appBar: PlatformAppBar(
          ios: (context) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
          title: PlatformText(Messages.current.bookDetails),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PlatformText(model.title ?? ""),
                    SizedBox(height: 10),
                    PlatformText(model.isbn ?? ""),
                    SizedBox(height: 10),
                    PlatformText(model.description ?? ""),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
