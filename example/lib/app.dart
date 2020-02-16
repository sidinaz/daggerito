import 'package:example/app/bootstrap/route_info.dart';
import 'package:example/app/data/app_repository.dart';
import 'package:example/app/di/app_component.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/app/theme/theme_manager.dart';
import 'package:example/features/book/controller.dart';
import 'package:example/features/home/home_controller.dart';
import 'package:example/features/public/controller.dart';
import 'package:example/features/settings/settings_controller.dart';
import 'package:example/user/inject_components_controller.dart';
import 'package:example/user/user_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class App extends BaseView with TitaniumApp<AppComponent> {
  static const appName = 'Daggerito example app';
  final RouteInfo initialUrl;

  ComponentFactory<AppComponent> get appComponentFactory => AppComponent.create;

  RouterBinder get binder => RouterBinder(
        [
          AppGeneralBindable(
            publicController: PublicController(),
          ),
          RouterBindable(
            path: "/app",
            controllers: [
              InjectComponentsController(),
              BooksController(),
              SettingsController(),
              HomeController(),
            ],
          ),
        ],
        routerFactory,
      );

  ThemeManager get themeManager => fields.appSubComponent != null
      ? fields.appSubComponent<ThemeManager>()
      : fields.appComponent<ThemeManager>();

  Locale get locale =>
      fields.appSubComponent != null ? fields.appSubComponent<Locale>() : null;

  AppRepository get appRepository => fields.appComponent<AppRepository>();

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
        data: themeManager.brightness == Brightness.light
            ? themeManager.materialTheme
            : themeManager.materialDarkTheme,
        child: PlatformProvider(
          initialPlatform: themeManager.targetPlatform,
          builder: (context) => PlatformApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              Messages.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: Messages.delegate.supportedLocales,
            locale: locale,
            title: appName,
            android: (_) => MaterialAppData(
              theme: themeManager.materialTheme,
              darkTheme: themeManager.materialDarkTheme,
              themeMode: themeManager.brightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
            ),
            ios: (_) => CupertinoAppData(
              theme: themeManager.cupertinoTheme,
            ),
            home: child,
          ),
        ),
      );

  Widget splashScreen(BuildContext context) => Container();

  @override
  void onAppComponentCreated(AppComponent appComponent) {
    createUserComponent(appComponent);
  }

  @override
  void restartApplication() {
    super.restartApplication();
    createUserComponent(fields.appComponent);
  }

  void createUserComponent(AppComponent appComponent) {
    disposeBag.addAll([
      appComponent<AppRepository>().getUserInfo().listen(
        (userInfo) {
          final userComponent = UserComponent(
            appComponent: fields.appComponent,
            userInfo: userInfo,
          );
          fields.appSubComponent = userComponent;
          startApplication();
        },
        onError: userIsMissingError,
      ),
    ]);
  }

  void userIsMissingError(Object error) {
    print(error);
    startApplication();
  }

  void login() {
    restartApplication();
  }

  void logOut() {
    disposeBag.addAll([
      appRepository.logOut().listen((_) => restartApplication()),
    ]);
  }

  @override
  void componentDidMount() {
    super.componentDidMount();
    disposeBag.addAll([
      EventBus().listen<AppEvent>(($) {
        login();
      }, (appEvent) => appEvent.type == AppEventType.LOG_IN),
      EventBus().listen<AppEvent>(($) {
        logOut();
      }, (appEvent) => appEvent.type == AppEventType.LOG_OUT),
    ]);
  }
}
