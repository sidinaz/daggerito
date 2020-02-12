import 'package:equatable/equatable.dart';
import 'package:example/app/database/database.dart';

class AppSettingsModel with EquatableMixin {
  final LayoutGC layoutGC;
  final LookGC lookGC;

  AppSettingsModel({this.layoutGC, this.lookGC});

  @override
  List get props => [layoutGC, lookGC];
}
