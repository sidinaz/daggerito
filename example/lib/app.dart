import 'package:example/app/bootstrap/titanium_app.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class App extends BaseView with TitaniumApp {
  static const appName = 'Daggerito example app';
  final RouteInfo initialUrl;

  App({@required this.initialUrl});

  Widget buildWidget(BuildContext context) => isReady
      ? buildAppContent(
          managedView(
            initialUrl.path,
            initialUrl.params,
          )(context),
        )
      : splashScreen(context);

  Widget buildAppContent(Widget child) => Theme(
        data: fields.themeManager.brightness == Brightness.light
            ? fields.themeManager.materialTheme
            : fields.themeManager.materialDarkTheme,
        child: PlatformProvider(
          initialPlatform: fields.themeManager.targetPlatform,
          builder: (context) => PlatformApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              Messages.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: Messages.delegate.supportedLocales,
            locale: fields.locale,
            title: appName,
            android: (_) => MaterialAppData(
              theme: fields.themeManager.materialTheme,
              darkTheme: fields.themeManager.materialDarkTheme,
              themeMode: fields.themeManager.brightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
            ),
            ios: (_) => CupertinoAppData(
              theme: fields.themeManager.cupertinoTheme,
            ),
            home: child,
          ),
        ),
      );

  Widget splashScreen(BuildContext context) =>
      Container();
}
