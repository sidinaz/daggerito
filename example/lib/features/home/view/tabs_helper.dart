import 'package:example/app/locale/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TabsHelper {
  final List<_TabItem> _allTabs;

  TabsHelper._(this._allTabs);

  List<BottomNavigationBarItem> items(BuildContext context) {
    return _allTabs.map((tab) => tab.toItem(context)).toList();
  }

  List<String> paths() {
    return _allTabs.map((tab) => tab.path).toList();
  }

  factory TabsHelper() {
    final allTabs = [
      _TabItem(
        "/app/books/list",
        iconData: Icons.library_books,
        title: Text(Messages.current.listBooks),
      ),
      _TabItem(
        "/app/debug",
        iconData: Icons.info,
        title: Text(Messages.current.debug),
      ),
      _TabItem(
        "/app/more",
        iconData: Icons.more,
        title: Text(Messages.current.more),
      ),
      // ignore: missing_return
    ];
    return TabsHelper._(allTabs);
  }
}

class _TabItem {
  final String path;
  final IconData iconData;
  final Text title;

  BottomNavigationBarItem toItem(BuildContext context) =>
      BottomNavigationBarItem(
        icon: Icon(iconData,),
        title: title,
      );

  _TabItem(this.path, {this.iconData, this.title});
}
