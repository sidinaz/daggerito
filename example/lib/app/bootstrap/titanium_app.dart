import 'package:example/app/bootstrap/router_binder.dart';
import 'package:example/app/data/app_repository.dart';
import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/di/app_component.dart';
import 'package:example/app/theme/theme_manager.dart';
import 'package:example/user/user_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kohana/kohana.dart';

mixin TitaniumApp on BaseView {
  static AppComponent get appComponent => _fieldsInstance.appComponent;

  static UserComponent get userComponent => _fieldsInstance.userComponent;

  static bool get loggedIn => userComponent != null;
  static _Fields _fieldsInstance;

  bool get isReady => _isReady != null ? _isReady.value : false;
  ValueNotifier<bool> _isReady;
  _Fields fields;

  void createAppComponent() {
    var subscription = AppComponent.create()
        .asStream()
        .listen(appComponentCreated);
    disposeBag.add(subscription);
  }

  void appComponentCreated(appComponent) {
    fields.appComponent = appComponent;
    checkForUser();
  }

  void checkForUser() {
    disposeBag.addAll([
      fields.appComponent<AppRepository>().getUserInfo().listen(
            (userInfo) => createUserComponent(userInfo),
            onError: userIsMissingError,
          ),
    ]);
  }

  void createUserComponent(UserInfo userInfo) {
    final userComponent = UserComponent(
      appComponent: fields.appComponent,
      userInfo: userInfo,
    );
    fields.userComponent = userComponent;

    startApplication();
  }

  void startApplication() {
    bindRouter();
    _isReady.value = true;
  }

  void bindRouter() => RouterBinder().bind();

  void userIsMissingError(Object error) {
    print(error);
    startApplication();
  }

  @override
  void handleManagedFields() {
    fields = _fieldsInstance = managedField(() => _Fields());
    _isReady = useState(false);
  }

  @override
  void componentDidMount() {
    createAppComponent();
    disposeBag.addAll([
      EventBus().listen<AppEvent>(($) {
        resetApp();
      }, (appEvent) => appEvent.type == AppEventType.RESTART),
      EventBus().listen<AppEvent>(($) {
        login();
      }, (appEvent) => appEvent.type == AppEventType.LOG_IN),
      EventBus().listen<AppEvent>(($) {
        logOut();
      }, (appEvent) => appEvent.type == AppEventType.LOG_OUT),
    ]);
  }

  void resetApp() {
    _isReady.value = false;
    clearViews();
    fields.resetUser();
    checkForUser();
  }

  void login() {
    resetApp();
  }

  void logOut() {
    disposeBag.addAll([
      fields.appRepository.logOut().listen((_) => resetApp()),
    ]);
  }
}

class RouteInfo {
  final String path;
  final Map<String, dynamic> params;

  RouteInfo(this.path, {this.params});

  @override
  int get hashCode => path.hashCode;

  @override
  bool operator ==(dynamic other) => other.path == this.path;
}

class _Fields {
  static var counter = 0;
  AppComponent appComponent;
  UserComponent userComponent;

  ThemeManager get themeManager => userComponent != null
      ? userComponent<ThemeManager>()
      : appComponent<ThemeManager>();

  Locale get locale => userComponent != null ? userComponent<Locale>() : null;

  AppRepository get appRepository => appComponent<AppRepository>();

  _Fields() {
    counter++;
  }

  void resetUser() {
    userComponent = null;
  }
}
