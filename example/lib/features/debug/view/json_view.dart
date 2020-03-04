import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/app/ui/layout_manager.dart';
import 'package:example/features/debug/view/debug_widget.dart';
import 'package:example/features/debug/view/user_info_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class JsonView extends BaseView {
  final title = "Json view";
  final LayoutManager layout;
  final UserInfo userInfo;
  final UserInfoAlert userInfoAlert;

  JsonView(this.layout, this.userInfo, this.userInfoAlert);

  @override
  Widget buildWidget(BuildContext context) => Scaffold(
    body: Container(),
  );

  void setText(){
    var component = TitaniumApp.appSubComponent;
  }
}
