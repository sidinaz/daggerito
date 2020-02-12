import 'package:example/app/theme/theme_manager.dart';
import 'package:example/app/ui/check_platform_mixin.dart';
import 'package:example/features/home/view/tabs_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class HomeViewWithTabs extends BaseView with CheckPlatformMixin {
  final TabsHelper _tabsHelper;
  final ThemeManager themeManager;

  HomeViewWithTabs(this._tabsHelper, this.themeManager);

  _Fields fields;

  @override
  void handleManagedFields() {
    super.handleManagedFields();
    var tickerProvider = useSingleTickerProvider();
    fields = managedField(() => _Fields(
          _tabsHelper,
          TabController(length: 3, vsync: tickerProvider),
        ));
  }

  Widget buildWidget(BuildContext context) => PlatformScaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: buildTabBar(context),
            ),
            Observer(
              stream: fields.selectedTab,
              onSuccess: (context, selectedTab) =>                 PlatformNavBar(
                items: _tabsHelper.items(context),
                currentIndex: selectedTab,
                itemChanged: _onItemTapped,
              ),


            )
          ],
        ),
      );

  void _onItemTapped(int value) {
    fields.selectedTab.add(value);
    fields._tabController.animateTo(value);
  }

  Widget buildTabBar(BuildContext context) => TabBarView(
        controller: fields._tabController,
        children: fields.tabsHelper
            .paths()
            .map((path) =>
                KeepAliveViewWrapper(child: managedView(path)(context)))
            .toList(),
      );

  @override
  void componentDidMount() {
    checkPlatform(themeManager);
  }
}

class _Fields {
  final TabsHelper tabsHelper;
  final TabController _tabController;

  // ignore: close_sinks
  final selectedTab = BehaviorSubject.seeded(0);

  void resetTabs() => selectedTab.add(0);

  _Fields(this.tabsHelper, this._tabController);
}
