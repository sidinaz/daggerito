import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';
//

mixin LoadAwareBaseViewMixin<T extends BaseViewModel> on BaseView<T> {
  _Fields _fields;

  Stream<bool> get _isWaiting => _fields._isWaitingSubject;

  Widget buildWidgetWithSpinner({Widget child}) => Stack(
        children: <Widget>[
          child,
          Observer<bool>(
            stream: _isWaiting,
            onSuccess: (ctx, isWaiting) => Offstage(
              offstage: !isWaiting,
              child: Center(
                child:             Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlatformCircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          )
        ],
      );

  @override
  void handleManagedFields() {
    super.handleManagedFields();
    _fields = managedField(() => _Fields());
  }

  @override
  void componentDidMount() {
    super.componentDidMount();
    disposeBag.addAll([
      EventBus()
        .asStream()
        .listenForAppEvent<AppEvent>((event) {
        _fields._isWaitingSubject.add(event.payload);
      }, (appEvent) => appEvent.type == AppEventType.IS_WAITING),
    ]);
  }
}

class _Fields{
  final _isWaitingSubject = BehaviorSubject<bool>.seeded(false);
}